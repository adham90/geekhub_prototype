class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :company
      t.belongs_to :title
      t.text :description
      t.boolean :currently_work, default: false
      t.belongs_to :profile
      t.timestamps null: false
    end
  end
end
