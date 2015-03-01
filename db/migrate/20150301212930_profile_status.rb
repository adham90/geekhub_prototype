class ProfileStatus < ActiveRecord::Migration
  def up
    add_column :profiles, :status, :string, default: ""
  end

  def down
    remove_column :profiles, :status
  end
end
