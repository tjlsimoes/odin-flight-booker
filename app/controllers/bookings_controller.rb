class BookingsController < ApplicationController
  def new
    @booking = Booking.new(selection_params)
    @flight = Flight.find(@booking.flight_id)
    @airports = [Airport.find(@flight[:departure_airport_id]),
                  Airport.find(@flight[:arrival_airport_id])]
    @nbr_passengers = @booking[:nbr_passengers]
    
    for i in 1..@nbr_passengers do
      @booking.passengers.build
    end
  end
    end
  end

  private
  def selection_params
    params.require(:booking).permit(:nbr_passengers,
                              :selected_flight_id)
  end
end
