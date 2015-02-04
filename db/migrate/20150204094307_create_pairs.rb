class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :driver_id, null: false, index: true
      t.integer :navigator_id, null: false, index: true
      t.date    :pair_date, null: false
      t.time    :pair_time, null: false
      t.datetime :confirmed_at
      t.boolean :confirmation_status #true => accepted, fales => denied
      t.float   :latitude, index: true
      t.float   :longitude, index: true
      t.string  :address
      t.string  :address_details
      t.text    :details
      t.boolean :type, default: false #fales => offline, true => online
      t.string  :hangout_url
      t.integer :last_updated_by
      t.boolean :last_update_confirmation
      t.integer :cancelled, default: false
      t.datetime :cancelled_at
      t.boolean :done, default: false
      t.timestamps null: false
    end
  end
end
