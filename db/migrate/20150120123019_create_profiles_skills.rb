class CreateProfilesSkills < ActiveRecord::Migration
  def change
    create_table :profiles_skills, id: false do |t|
      t.integer :profile_id
      t.integer :skill_id
      t.integer :rank
      t.boolean :primary
      t.date    :started_at
      t.string  :description
    end
    add_index :profiles_skills, [:profile_id, :skill_id]
  end
end
