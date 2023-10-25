class DropJoinTable < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :bookings, :flights
  end
end
