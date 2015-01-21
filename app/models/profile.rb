class Profile < ActiveRecord::Base
  belongs_to :user
  # has_and_belongs_to_many :skills, -> { uniq }

  accepts_nested_attributes_for :user

  # validates_uniqueness_of :skills

  validates_presence_of :user
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  validates :age, presence: true, length: {maximum: 4}, numericality: {only_integer: true, greater_than_or_equal_to: Date.today.year - 90 , less_than_or_equal_to: Date.today.year + 90}
  # validates_numericality_of :rank

  has_attached_file :avatar, styles: {
   medium: "300x300>",
   small:  "100x100>",
   thumb:  '64x64!'
  }, :default_url => "/images/unknown_user.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def add_skill? skill
    skill = Skill.find_or_create_by!(name: skill)
    unless self.skills.include?(skill)
      self.skills << skill
    else
      false
    end
  end
end
