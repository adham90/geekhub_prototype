class Pair < ActiveRecord::Base
  belongs_to :profile, as: driver
  has_one    :profile, as: navigator
  has_and_belongs_to_many :skills
end
