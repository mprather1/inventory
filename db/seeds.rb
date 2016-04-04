# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Device.destroy_all

User.create(first_name: "Kill", last_name: "Bill", username: "killb", password: 'dead', password_confirmation: 'dead')
User.create(first_name: "Nick", last_name: "Cage", username: "cagen", password: '1234', password_confirmation: '1234', admin: true)


50.times do |x|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, password: Faker::Internet.password, admin: false)
end

150.times do |x|
  Device.create(device_type: "iPad", serial_number: Faker::Number.number(10), user_id: Faker::Number.between(1, 50))
end
