class CreateProfileJobs < ActiveRecord::Migration
  def change
    create_table :profile_jobs do |t|
      t.belongs_to :company
      t.string     :title
      t.text       :description
      t.boolean    :currently_in, default: false
      t.date       :enroll_date
      t.date       :quit_date
      t.belongs_to :profile
    end
  end
end
