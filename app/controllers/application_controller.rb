require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :valid_notice

  private

  def hide_navbar
    @hide_navbar = true
  end

  def valid_notice
    if user_signed_in?
      unless Profile.valid?(current_user.profile)
        flash[:error] = nil
        flash[:error] = "You need to complete your info in order to be visible to other geeks."
      end
    end
  end

end
