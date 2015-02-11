class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name, null: false, index: true
      t.string :description
      t.string :ancestry, index: true
    end
  end
end
