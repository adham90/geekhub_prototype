class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string  :username, null: false, index: true, unique: true
      t.string  :name,     null: false
      t.text    :bio
      t.string  :phone,    null: false, index: true, unique: true
      t.integer :rank
      t.integer :age,     null: false
      t.boolean :gender,  null: false
      t.float   :latitude, index: true
      t.float   :longitude, index: true
      t.string  :address
      t.references :title, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
