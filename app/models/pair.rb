class Pair < ActiveRecord::Base

  self.inheritance_column = nil
  belongs_to  :navigator, class_name: "Profile", foreign_key: :navigator_id
  belongs_to  :driver,    class_name: "Profile", foreign_key: :driver_id

  validate  :navigator_not_the_same
  validate  :online
  validates :details,   presence: true, length: { minimum: 20 }
  validates :pair_date, presence: true
  validates :pair_time, presence: true


  def online
    if self.type == false
      if self.address == ""
        errors.add(:address, "can't be blank")
      end
    else
      if self.hangout_url == ""
        errors.add(:hangout_url, "can't be blank")
      end
      # validates :hangout_url, presence: true
    end
  end

  def navigator_not_the_same
    errors.add(:navigator, "You can't navigate your-self") if driver_id == navigator_id
  end
end
