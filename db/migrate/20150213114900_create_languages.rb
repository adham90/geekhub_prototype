class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name, index: true, null: false
      t.string :native_name, index: true, null: false
      t.string :code, index: true, null: false
    end
  end
end
