require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :valid_notice

  private

  def hide_navbar
    @hide_navbar = true
  end
  def hide_footer
    @hide_footer = true
  end

  def valid_notice
    if user_signed_in?
      profile = current_user.profile

      if profile.skills.count <= 0 and profile.address == "" and profile.first_name == ""
        flash[:error] = "You need to complete your info in order to be visible to other geeks."
      else
        if profile.first_name == ""
          flash[:error] = "You have to provide your first name to be visible to other geeks."
        end
        if profile.address == ""
          flash[:error] = "You have to provide your address to be visible to other geeks."
        end
        if profile.skills.count <= 0
          flash[:error] = "You must have one skill at least to be visible to other geeks."
        end
      end
    end
  end

end
