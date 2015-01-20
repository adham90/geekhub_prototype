class Skill < ActiveRecord::Base
  # has_and_belongs_to_many :profiles, -> { uniq }

  # validates_uniqueness_of :profiles
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
end
