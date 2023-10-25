class RemoveStartFromFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :start, :datetime
  end
end
