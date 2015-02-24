class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end

  def facebook_auth
    auth = request.env["omniauth.auth"]
    largeimage = "http://graph.facebook.com/#{auth.uid}/picture?type=large"
    { email: auth.info.email,
      identity: {
        uid:      auth.uid,
        provider: auth.provider
      },
      profile: {
        username:   "fb#{auth.uid}",
        first_name: auth.extra.raw_info.first_name,
        last_name:  auth.extra.raw_info.last_name,
        bio:        auth.extra.raw_info.bio,
        # age:        Date.strptime(auth.extra.raw_info.birthday,'%Y'),
        gender:     auth.extra.raw_info.gender == "male"? true : false,
        address:    auth.extra.raw_info.location.name,
        avatar:     process_uri(largeimage),
        facebook:   "https://www.fb.com/#{auth.uid}"
      }
    }
  end

  def all
    # Rails.logger.debug "=============================================="
    # Rails.logger.debug request.env["omniauth.auth"]
    # Rails.logger.debug "=============================================="

    identity = Identity.where("provider" => facebook_auth[:identity][:provider]).where("uid" => facebook_auth[:identity][:uid]).first
    if identity
      flash.notice = "Signed in!"
      sign_in_and_redirect identity.user
    else
      profile = Profile.new(facebook_auth[:profile])
      profile.build_user(email: facebook_auth[:email])
      profile.user.identities.push(Identity.new(facebook_auth[:identity]))
      if profile.save
        sign_in profile.user
        redirect_to after_signup_path(:confirm_profile)
      else
        flash[:error] = "Sign in fall!"
        redirect_to signup_path
      end
    end
  end

  alias_method :facebook, :all
end
