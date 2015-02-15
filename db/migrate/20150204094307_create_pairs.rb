# class CreatePairs < ActiveRecord::Migration
#   def change
#     create_table :pairs do |t|
#       ## Users who will pair
#       t.integer :driver_id, null: false, index: true
#       t.integer :navigator_id, null: false, index: true
#
#       ## Pair Date and Time
#       t.datetime :pair_date, null: false
#       t.integer  :pair_time, null: false
#
#       ## Navigator Confirmation
#       t.datetime :confirmed_at
#       t.boolean :confirmation_status #true => accepted, fales => denied
#
#       ## Pair address details
#       t.float   :latitude, index: true
#       t.float   :longitude, index: true
#       t.string  :address
#       t.string  :address_details
#
#       ## Pair Basic info
#       t.text    :details
#       t.boolean :type, default: false #fales => offline, true => online
#
#       ## For online Pairng
#       t.string  :hangout_url
#
#       ## Pair edit activitys
#       t.integer :last_updated_by
#       t.boolean :last_update_confirmation
#
#       ## Deriver cancelled by
#       t.integer :cancelled, default: false
#
#       ## Pair ended
#       t.boolean :done, default: false
#
#       t.timestamps null: false
#     end
#   end
# end
