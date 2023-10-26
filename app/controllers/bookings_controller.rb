class BookingsController < ApplicationController
  def new
    @booking = Booking.new
		if params[:flight_id] && params[:nbr_passengers]
			@flight = Flight.find(params[:flight_id])
			@airports = [Airport.find(@flight[:departure_airport_id]),
										Airport.find(@flight[:arrival_airport_id])]
			
		end
		@nbr_passengers = params[:nbr_passengers].to_i
		for i in 1..@nbr_passengers do
			@booking.passengers.build
		end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path
    else
			@flight = Flight.find(params[:booking][:flight_id])
			@airports = [Airport.find(@flight[:departure_airport_id]),
										Airport.find(@flight[:arrival_airport_id])]
			@nbr_passengers = params[:booking][:nbr_passengers].to_i
      render :new, status: :unprocessable_entity
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:nbr_passengers,
                              :flight_id, :billing_address,
                              passengers_attributes:[:name,
                                                    :email])
  end
end
