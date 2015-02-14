class CreateProfileSkillTags < ActiveRecord::Migration
  def change
    create_table :profile_skill_tags do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :profile_skill, index: true
      t.timestamps null: false
    end
  end
end
