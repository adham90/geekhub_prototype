require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def hide_navbar
      @hide_navbar = true
    end
    def hide_footer
      @hide_footer = true
    end

    def valid_notice
      if user_signed_in?
        unless current_user.profile.present?
          @profile = Profile.new()
          profile_skill = ProfileSkill.new
          @profile.user = current_user
          @profile.profile_skills.new()
          redirect_to after_signup_path(:confirm_facebook)
        end
      end
    end

end
