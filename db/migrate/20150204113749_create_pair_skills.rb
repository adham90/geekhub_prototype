class CreatePairSkills < ActiveRecord::Migration
  def change
    create_table :pair_skills do |t|
      t.references :pair, index: true
      t.references :skill, index: true
    end
    add_foreign_key :pair_skills, :pairs
    add_foreign_key :pair_skills, :skills
  end
end
