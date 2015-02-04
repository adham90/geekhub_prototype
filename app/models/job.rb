class Job < ActiveRecord::Base
  belongs_to :profile
  #
  # def company_name
  #   company.try(:name)
  # end
  #
  # def company_name=(name)
  #   self.company = Company.find_or_create_by(name: name) if name.present?
  # end
end
