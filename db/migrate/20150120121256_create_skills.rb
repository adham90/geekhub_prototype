class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false, index: true
      t.date   :created_at
    end
    add_attachment :skills, :avatar
  end
end
