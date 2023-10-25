class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: selection_params[:selected_flight_id],
                nbr_passengers: selection_params[:nbr_passengers])
    @passengers = []
    
    selection_params[:nbr_passengers].times do
      @passengers << Passenger.new
    end
  end

  private
  def selection_params
    params.require(:booking).permit(:nbr_passengers,
                              :selected_flight_id)
  end
end
