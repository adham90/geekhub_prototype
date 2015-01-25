class AddUniversityToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :university, index: true
  end
end
