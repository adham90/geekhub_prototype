# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Skill.destroy_all
University.destroy_all

20.times do |n|
  Skill.create(
    name: "skill#{n}",
  )
end

3.times do |n|

  University.create(name: Faker::Lorem.word)

  User.create(
    email: n.to_s + Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )

  Profile.create(
    user: User.last,
    username: "user#{n}",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: "#{n}" + Faker::PhoneNumber.phone_number,
    age: 1990,
    gender: true,
    address: Faker::Address.country,
    bio: Faker::Lorem.sentence,
    avatar: Faker::Avatar.image,
    university_id: n,
    title: "title#{n}"
  )

end
