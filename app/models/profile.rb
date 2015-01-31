class Profile < ActiveRecord::Base

  belongs_to :user
  # has_and_belongs_to_many :skills, -> { uniq }

  belongs_to :university
  has_many :companies, through: :jobs
  has_many :jobs

  # autocomplete :company, :name

  accepts_nested_attributes_for :user

  # validates_uniqueness_of :skills

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :address_changed?


  validates_presence_of :user

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: {maximum: 50},
                       format: /\A[a-zA-Z\d]*\z/

  validates :first_name, presence: true, length: {maximum: 50}

  validates :phone, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: {maximum: 50}

  validates :age, presence: true,
                  length: {maximum: 4},
                  numericality: {only_integer: true,
                    greater_than_or_equal_to: Date.today.year - 90 ,
                    less_than_or_equal_to: Date.today.year + 90}


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

  def name
    "#{first_name} #{last_name}"
  end

  def university_name
    university.try(:name)
  end

  def university_name=(name)
    self.university = University.find_or_create_by(name: name) if name.present?
  end
end
