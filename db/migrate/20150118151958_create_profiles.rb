class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string  :username, null: false, index: true, unique: true
      t.string  :first_name
      t.string  :last_name
      t.text    :bio
      t.string  :phone
      t.integer :rank
      t.date    :age
      t.boolean :gender
      t.string  :title
      t.float   :latitude, index: true
      t.float   :longitude, index: true
      t.string  :address
      t.string  :university
      t.integer :domain_id, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
    add_attachment :profiles, :avatar
  end
end
