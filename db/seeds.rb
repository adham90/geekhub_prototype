# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Skill.destroy_all

2.times do |n|
  Skill.create(
    name: "skill#{n}",
  )
end

500.times do |n|
  User.create(
    email: Faker::Internet.safe_email,
    password: "password",
    password_confirmation: "password"
  )

  Profile.create(
    user: User.last,
    username: Faker::Internet.user_name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: "#{n}" + Faker::PhoneNumber.phone_number,
    age: 1990,
    gender: true,
    address: Faker::Address.country,
    bio: Faker::Lorem.sentence,
    university: Faker::Lorem.word,
    title: Faker::Name.title
  )
end
