class ProfileSkill < ActiveRecord::Base
  before_save :find_or_create_skill

  belongs_to :profile
  belongs_to :skill

  # validates_uniqueness_of :skill_id, :scope => :profile_id
  # validates_presence_of :skill, :experience_years, :profile

  accepts_nested_attributes_for :skill

  def skill_name
    self.skill.name if skill.present?
  end

  def skill_name=(value)
    @skill = value
  end

  def find_or_create_skill
    self.skill_id = Skill.find_or_create_by!(name: @skill.strip).id
  end
end
