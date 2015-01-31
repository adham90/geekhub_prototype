class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string  :username, null: false, index: true, unique: true
      t.string  :first_name,     null: false
      t.string  :last_name
      t.text    :bio
      t.string  :phone,    null: false, index: true, unique: true
      t.integer :rank
      t.integer :age,     null: false
      t.boolean :gender,  null: false
      t.string  :title
      t.float   :latitude, index: true
      t.float   :longitude, index: true
      t.string  :address
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
    add_attachment :profiles, :avatar
  end
end
