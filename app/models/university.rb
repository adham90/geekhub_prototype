class University < ActiveRecord::Base
  validates :name, presence: true, 
                 uniqueness: { case_sensitive: false },
                 length: {maximum: 100}
end
