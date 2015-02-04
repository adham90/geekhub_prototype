class CreateProfileJobs < ActiveRecord::Migration
  def change
    create_table :profile_jobs do |t|
      t.string     :company
      t.string     :title
      t.text       :description
      t.boolean    :currently_in, default: false
      t.date       :enroll_date
      t.date       :quit_date
      t.belongs_to :profile, index: true
    end
    add_foreign_key :profile_skills, :profiles
    add_foreign_key :profile_skills, :skills
  end
end
