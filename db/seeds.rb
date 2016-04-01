# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Kill", last_name: "Bill")
User.create(first_name: "Nick", last_name: "Cage")

Device.create(serial_number: 'F5RKT1PADFHW', user_id: 1)
Device.create(serial_number: 'F5RKT1FUKFHW', user_id: 1)
Device.create(serial_number: 'DVPHR1FUKFHW', user_id: 2)
