class ProfileSkill < ActiveRecord::Base
  before_validation :find_or_create_skill

  belongs_to :profile
  belongs_to :skill

  # validates_uniqueness_of :skill_id, :scope => :profile_id
  validates_presence_of :skill_id, :experience_years

  validates_numericality_of :experience_years, :only_integer =>true,
                            length: {maximum: 4},
                            :greater_than_or_equal_to =>0,
                            :message => "invalid experience years"


  accepts_nested_attributes_for :skill, :reject_if => :all_blank

  def skill_name
    self.skill.name if skill.present?
  end

  def skill_name=(value)
    @skill = value
  end

  def find_or_create_skill
    if @skill.strip.downcase.present? || @skill.strip.downcase != ""
      self.skill_id = Skill.find_or_create_by!(name: @skill.strip.downcase).id
    end
  end
end
