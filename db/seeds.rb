# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Write some code to seed the database with airport info

User.destroy_all

users = User.create([ {first_name: "Raghu", last_name: "Betina", email: 'raghu@starterleague.com', password: 'test', ff_miles: 0}, {first_name: "Jeff", last_name: "Cohen", email: "jeff@starterleague.com", password: 'test', ff_miles: 0}])

puts "#{users.count} users created"

Airport.destroy_all

airports = Airport.create([ {city: "Chicago", code: "ORD"},
                            {city: "Los Angeles", code: "LAX"},
                            {city: "San Francisco", code: "SFO"},
                            {city: "New York", code: "JFK"} ])

puts "#{airports.count} airports created"


Flight.destroy_all



# Refactor to guarantee unique arrival and departure airports
flight_num_array = (100..999).to_a.shuffle
100.times do
  two_airports = airports.sample(2)
  Flight.create( number: flight_num_array.pop,
                 departs_at: Time.parse("#{rand(4)}:00"),
                 seats: [0,65,30,20].sample,
                 arrival_airport_id: two_airports[0].id,
                 departure_airport_id: two_airports[1].id)
end

puts "100 flights created"

puts
puts "Can you write the appropriate has_many/belongs_to to make these work?"
puts
puts "Flight.first.departure_airport"
puts "Flight.first.arrival_airport"
puts "Airport.first.departures"
puts "Airport.first.arrivals"
puts "Airport.first.flights"
puts
puts "Can you write methods or scopes to make this code work?"
puts
puts "Airport.first.departures.sold_out"
puts "Airport.first.departures.with_seats"













