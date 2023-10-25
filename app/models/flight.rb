class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings

	def self.restrain(search)
		if search
			self.where(start: search[:start]).where(
				departure_airport_id: search[:departure_airport_id]).where(
					arrival_airport_id: search[:arrival_airport_id])
		else
			Flight.all
		end
	end
end
