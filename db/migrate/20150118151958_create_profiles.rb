class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      ## basic info
      t.string  :username, null: false, index: true, unique: true
      t.string  :first_name
      t.string  :last_name
      t.text    :bio
      t.string  :phone
      t.date    :age
      t.boolean :gender    # Male => true, Female => false
      t.string  :university

      ## Job Current Position
      t.string  :job_title
      t.string  :job_company
      t.text    :job_details

      ## Address
      t.string  :address
      t.float   :latitude, index: true
      t.float   :longitude, index: true

      t.integer :rank
      t.integer :domain_id, index: true # Domain Expert
      t.belongs_to :user, index: true

      ## Linked accounts
      t.string  :facebook
      t.string  :twitter
      t.string  :github
      t.string  :linkedin

      t.timestamps null: false
    end
    add_attachment :profiles, :avatar
  end
end
