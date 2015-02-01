class CreateProfileSkills < ActiveRecord::Migration
  def change
    create_table :profile_skills, id: false do |t|
      t.integer :profile_id
      t.integer :skill_id
      t.integer :rank
      t.boolean :primary
      t.date    :started_at
      t.string  :description
    end
    add_index :profile_skills, [:profile_id, :skill_id]
  end
end
