# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Write some code to seed the database with airport info

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
                 seats: 65,
                 arrival_airport_id: two_airports[0].id,
                 departure_airport_id: two_airports[1].id)
end

puts "100 flights created"















