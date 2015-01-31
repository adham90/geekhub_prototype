class CreateIdentity < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :uid
      t.string :provider
      t.belongs_to :profile, index: true
    end
  end
end
