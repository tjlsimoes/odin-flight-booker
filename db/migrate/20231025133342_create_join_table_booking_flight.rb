class CreateJoinTableBookingFlight < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bookings, :flights do |t|
      # t.index [:booking_id, :flight_id]
      # t.index [:flight_id, :booking_id]
    end
  end
end
