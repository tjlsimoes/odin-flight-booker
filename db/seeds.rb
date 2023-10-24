# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Flight.destroy_all
Airport.destroy_all

Airport.create!([{
	code: "LIS"
},
{
	code: "LPL"
},
{
	code: "LNZ"
},
{
	code: "LNK"
},
{
	code: "LUG"
},
{
	code: "MAD"
},
{
	code: "MHH"
},
{
	code: "ORK"
}
])

p "Created #{Airport.count} airports."

Flight.destroy_all

Flight.create!([{
	departure_airport_id: Airport.where(code: "LIS")[0].id,
	arrival_airport_id: Airport.where(code: "LPL")[0].id,
	duration: 60*60,
	start: Time.current.advance(weeks: 3).to_datetime
},
{
	departure_airport_id: Airport.where(code: "LPL")[0].id,
	arrival_airport_id: Airport.where(code: "LNZ")[0].id,
	duration: 60*60+30,
	start: Time.current.advance(weeks: 5).to_datetime
},
{
	departure_airport_id: Airport.where(code: "LNZ")[0].id,
	arrival_airport_id: Airport.where(code: "LNK")[0].id,
	duration: 60*60+80,
	start: Time.current.advance(weeks: 2).to_datetime
},
{
	departure_airport_id: Airport.where(code: "LNK")[0].id,
	arrival_airport_id: Airport.where(code: "LUG")[0].id,
	duration: 60*60*2,
	start: Time.current.advance(weeks: 6).to_datetime
},
{
	departure_airport_id: Airport.where(code: "LUG")[0].id,
	arrival_airport_id: Airport.where(code: "MAD")[0].id,
	duration: 60*60+90,
	start: Time.current.advance(weeks: 7).to_datetime
},
{
	departure_airport_id: Airport.where(code: "MAD")[0].id,
	arrival_airport_id: Airport.where(code: "MHH")[0].id,
	duration: 60*60+100,
	start: Time.current.advance(weeks: 8).to_datetime
},
{
	departure_airport_id: Airport.where(code: "MHH")[0].id,
	arrival_airport_id: Airport.where(code: "ORK")[0].id,
	duration: 60*60+125,
	start: Time.current.advance(weeks: 9).to_datetime
},
{
	departure_airport_id: Airport.where(code: "LIS")[0].id,
	arrival_airport_id: Airport.where(code: "ORK")[0].id,
	duration: 60*60*2+250,
	start: Time.current.advance(weeks: 10).to_datetime
}
])

p "Created #{Flight.count} flights."