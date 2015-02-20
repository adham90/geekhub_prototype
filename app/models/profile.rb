class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :profile_skills
  has_many :skills, through: :profile_skills
  has_and_belongs_to_many :languages

  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :profile_skills, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :user

  geocoded_by :address
  # reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :if => :address_changed?


  validates_presence_of :user

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: {maximum: 50},
                       format: /\A[a-zA-Z\d]*\z/

  validates :first_name, length: {maximum: 50}

  # validates_numericality_of :rank
  has_attached_file :avatar, styles: {
   medium: "200x200>",
   small:  "100x100>",
   thumb:  '64x64!'
  }, :default_url => lambda { |attach| "https://robohash.org/#{attach.instance.username}.png" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def name
    "#{first_name} #{last_name}"
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
