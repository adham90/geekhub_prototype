class Skill < ActiveRecord::Base

  has_many :profiles, through: :profile_skills
  has_and_belongs_to_many :companies
  
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: {maximum: 50}
end
