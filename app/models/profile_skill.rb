class ProfileSkill < ActiveRecord::Base
  belongs_to :profile
  belongs_to :skill

  validates_uniqueness_of :skill, :scope => :profile_id
end
