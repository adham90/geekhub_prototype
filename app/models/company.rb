class Company < ActiveRecord::Base
  has_and_belongs_to_many :skills

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :address_changed?
end
