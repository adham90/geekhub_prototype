class Skill < ActiveRecord::Base

  has_many :profile_skills
  has_many :profiles, through: :profile_skills

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: {maximum: 20}
end
