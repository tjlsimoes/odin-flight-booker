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

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def selection_params
    params.require(:booking).permit(:nbr_passengers,
                              :flight_id)
  end

  def booking_params
    params.require(:booking).permit(:nbr_passengers,
                              :flight_id, :billing_address,
                              :passengers_attributes[:name,
                                                    :email])
  end
end
