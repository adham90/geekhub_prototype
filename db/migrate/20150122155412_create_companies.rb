class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :description
      t.timestamps null: false
    end
  end
end
