class UserPrivacy < ActiveRecord::Base
  belongs_to  :privacy
  belongs_to  :profile
end
