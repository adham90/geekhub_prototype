class Privacy < ActiveRecord::Base
  has_many :user_privacies
  has_many :users, through: :user_privacies
end
