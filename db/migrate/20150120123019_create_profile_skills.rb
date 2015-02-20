class CreateProfileSkills < ActiveRecord::Migration
  def change
    create_table :profile_skills do |t|
      t.belongs_to :profile
      t.belongs_to :skill
      t.integer    :rank
      t.boolean    :primary
      t.integer    :experience_years
      t.text       :description
    end
    add_index :profile_skills, [:profile_id, :skill_id]
    add_foreign_key :profile_skills, :profiles
    add_foreign_key :profile_skills, :skills
  end
end
