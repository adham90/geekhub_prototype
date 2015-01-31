class CreateProfileUniversities < ActiveRecord::Migration
  def change
    create_table :profile_universities do |t|
      t.belongs_to :university
      t.belongs_to :profile
      t.boolean    :currently_in
      t.string     :degree
      t.integer    :enrollment_year
      t.integer    :graduation_year
    end
  end
end
