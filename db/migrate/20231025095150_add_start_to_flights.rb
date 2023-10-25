class AddStartToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :start, :string
  end
end
