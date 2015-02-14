class CreateLanguagesProfiles < ActiveRecord::Migration
  def change
    create_table :languages_profiles do |t|
      t.belongs_to :profile, index: true, null: false
      t.belongs_to :language, index: true, null: false
    end
  end
end
