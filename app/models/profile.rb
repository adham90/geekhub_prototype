class Profile < ActiveRecord::Base
  attr_accessor :valid
  belongs_to :user

  has_many :profile_skills
  has_many :skills, through: :profile_skills

  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :profile_skills, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :user

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :if => :address_changed?


  validates_presence_of :user

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: {maximum: 50},
                       format: /\A[a-zA-Z\d]*\z/

  validates :first_name, length: {maximum: 50}

  validates_presence_of :first_name, on: [ :update ]
  validates_presence_of :gender, on: [ :update ]
  validates_presence_of :age, on: [ :update ]

  # validates_numericality_of :rank
  has_attached_file :avatar, styles: {
    original: "200x200>",
    small:  "100x100>",
    thumb:  '64x64!'
  }, :default_url => lambda { |attach| "https://robohash.org/#{attach.instance.username}.png" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def name
    "#{first_name} #{last_name}"
  end

  # joins(:profile_skills).group("profile_skills.profile_id").having("count(profile_skills.id) > 0")
  # Profile.joins(:skills).select('profiles.*, count(skills.id) as n_skills').group('profiles.id').having('n_skills <= 0').where.not(first_name: nil, address: nil)

  scope :valid_users, -> { joins(:skills).group('profiles.id').having("count(skills.id) > 0").where.not(first_name: nil, address: nil)  }


  def self.valid?(profile)
    if profile.skills.count > 0
      true
    elsif profile.skills.count <= 0
      false
    end
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

end
