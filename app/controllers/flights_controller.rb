class FlightsController < ApplicationController
  def index
		@flights = Flight.all

		@departure_airports = @flights.map do |flight|
			[flight.departure_airport_id, Airport.find(flight.departure_airport_id).code]
		end

		@arrival_airports = @flights.map do |flight|
			[flight.arrival_airport_id, Airport.find(flight.arrival_airport_id).code]
		end

		@dates = @flights.map {|flight| flight.start}
		
		unless params[:search].nil?
			@flights = Flight.restrain(params[:search])
		end
  end
end
