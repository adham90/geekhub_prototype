class CreateProfileSkills < ActiveRecord::Migration
  def change
    create_table :profile_skills, id: false do |t|
      t.belongs_to :profile
      t.belongs_to :skill
      t.integer :rank
      t.boolean :primary
      t.date    :started_at
      t.string  :description
    end
    add_index :profile_skills, [:profile_id, :skill_id]
  end
end
