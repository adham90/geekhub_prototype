class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.string :country
      t.belongs_to :profile
      
    end
    add_attachment :universities, :avatar
  end
end
