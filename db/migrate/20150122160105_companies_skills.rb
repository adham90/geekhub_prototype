class CompaniesSkills < ActiveRecord::Migration
  def change
    create_table :companies_skills do |t|
      t.belongs_to :company, index: true
      t.belongs_to :skill, index: true
    end
  end
end
