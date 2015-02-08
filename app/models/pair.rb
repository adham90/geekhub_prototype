class Pair < ActiveRecord::Base

  self.inheritance_column = nil
  belongs_to  :navigator, class_name: "Profile", foreign_key: :navigator_id
  belongs_to  :driver,    class_name: "Profile", foreign_key: :driver_id
  has_and_belongs_to_many :skills

  accepts_nested_attributes_for :skills


  validate :navigator_not_the_same

  def navigator_not_the_same
    errors.add(:navigator, "You can't navigate your-self") if driver_id == navigator_id
  end
end
