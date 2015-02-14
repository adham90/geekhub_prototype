class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_drives_notification
  
  private
  def set_drives_notification
    if user_signed_in?
      @drives_notification = current_user.profile.drives.where(done: false)
    end
  end

end
