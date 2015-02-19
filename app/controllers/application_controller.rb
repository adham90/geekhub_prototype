require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_drives_notification, :load_lang

  private

  def load_lang
    if Language.count <= 0
      file = File.read("#{::Rails.root}/public/lang.json")
      lang = JSON.parse(file)
      lang.each do |l|
        Language.create(code: l["code"], name: l["name"], native_name: l["nativeName"])
      end
    end
  end


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
