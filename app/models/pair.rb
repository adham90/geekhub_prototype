class Pair < ActiveRecord::Base

  self.inheritance_column = nil
  belongs_to  :navigator, class_name: "Profile", foreign_key: :navigator_id
  belongs_to  :driver,    class_name: "Profile", foreign_key: :driver_id

  validate  :navigator_not_the_same
  validates :details,   presence: true, length: { minimum: 20 }
  validates :pair_date, presence: true
  validates :pair_time, presence: true
  if :type == false
    validates :address,   presence: true
  else
    validates :hangout_url, presence: true
  end

  def navigator_not_the_same
    errors.add(:navigator, "You can't navigate your-self") if driver_id == navigator_id
  end
end
