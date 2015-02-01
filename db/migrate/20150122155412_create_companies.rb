class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text   :description
      t.float  :latitude, index: true
      t.float  :longitude, index: true
      t.string :address
      t.belongs_to :company_account
    end
    add_attachment :companies, :avatar
  end
end
