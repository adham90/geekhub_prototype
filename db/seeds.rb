# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

20.times do |n|

  User.create(
    email: "email#{n}@email.com",
    password: "password",
    password_confirmation: "password"
  )

  Profile.create(
    user: User.last, 
    username: "user#{n}", 
    first_name: "first#{n}",
    last_name: "last",
    phone: "000-000-00#{n}", 
    age: 1990, 
    gender: true,
    address: "cairo, egypt",
    title: "web dev" 
  )

end