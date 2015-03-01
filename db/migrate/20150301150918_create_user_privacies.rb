class CreateUserPrivacies < ActiveRecord::Migration
  def change
    create_table :user_privacies do |t|
      t.belongs_to :profile, null: false
      t.belongs_to :privacies, null: false
      t.boolean    :status, null: false, default: true
      t.timestamps null: false
    end
  end
end
