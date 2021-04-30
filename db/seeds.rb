# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create(email: "me@me.com", name: "It's me!")
Timeslot.create(activity: "test activity", booked_email: "you@you.com", booked_time: Date.today(), taken: true, user: u)
puts "Succeeded"