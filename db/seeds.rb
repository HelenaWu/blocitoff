# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld'
    )
end

users= User.all


100.times do
  Item.create!(
    status: false,
    description: Faker::Lorem.sentence,
    user: users.sample
  )
end
items = Item.all

puts "#{items.count} Items created!"
puts "#{users.count} Users created!"