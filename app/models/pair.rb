class Pair < ActiveRecord::Base

  self.inheritance_column = nil
  belongs_to :profile, inverse_of: :driver
  has_one    :profile, inverse_of: :navigator
  has_and_belongs_to_many :skills

  validate :navigator_not_the_same

  def navigator_not_the_same
    errors.add(:navigator, "You can't navigate your-self") if driver_id == navigator_id
  end
end
