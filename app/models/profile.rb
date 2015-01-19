class Profile < ActiveRecord::Base
  belongs_to :user

  accepts_nested_attributes_for :user

  validates :user, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  validates :age, presence: true, length: {maximum: 4}
  validates_numericality_of :age
  
end
