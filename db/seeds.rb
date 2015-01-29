# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

100.times do |n|

  User.create(
    email: "email#{n}@email.com",
    password: "aaaaaaaa",
    password_confirmation: "aaaaaaaa"
  )

  Profile.create(
    user: User.last, 
    username: "user#{n}", 
    name: "name#{n}", 
    phone: "000011100#{n}", 
    age: 1990, 
    gender: true, 
    address: "cairo, egypt", 
    title_id: 1
  )

end