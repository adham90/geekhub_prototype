require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_drives_notification

  private

  def set_drives_notification
    if user_signed_in?
      profile = current_user.profile
      if profile.name == "" or profile.skills.count <= 0 or profile.address == ""
        flash[:error] = nil
        flash[:error] = "You need to complete your info in order to be visible to other geeks."
      end
    end
  end

end
