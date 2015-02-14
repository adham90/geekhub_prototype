class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :uid
      # Facebook, Github, ...
      t.string :provider
      t.belongs_to :user, index: true
    end
  end
end
