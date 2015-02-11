class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end

  def auth
    auth = request.env["omniauth.auth"]
    largeimage = "http://graph.facebook.com/#{auth.uid}/picture?type=large"
    { email: auth.info.email, 
      identity: {
        uid:      auth.uid,
        provider: auth.provider
      },
      profile: {
        first_name: auth.extra.raw_info.first_name,
        last_name: auth.extra.raw_info.last_name,
        bio:      auth.extra.raw_info.bio,
        age:      auth.extra.raw_info.birthday,
        gender:   true,
        username: auth.uid,
        phone: "0010010010",
        address: "cairo, egypt",
        avatar:   process_uri(largeimage),

      }
    }
  end

  def all
    Rails.logger.debug("=============================================")
    Rails.logger.debug(auth)
    Rails.logger.debug("=============================================")

    identity = Identity.where("provider" => auth[:identity][:provider]).where("uid" => auth[:identity][:uid]).first
    if identity
      # current_user = identity.profile.user
      flash.notice = "Signed in!"
      sign_in_and_redirect identity.profile.user
      # redirect_to root_path
    else
      profile = Profile.new(auth[:profile])
      profile.build_user(email: auth[:email], password: "password", password_confirmation: "password")
      profile.identities.push(Identity.new(auth[:identity]))
      if profile.save
        flash[:notice] = "Signed in!"
        sign_in_and_redirect profile.user
      else
        flash[:error] = "Sign in fall!"
        redirect_to signup_path
      end
    end
  end

  alias_method :facebook, :all
end
