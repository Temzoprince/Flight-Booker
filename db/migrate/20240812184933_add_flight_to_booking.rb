class AddFlightToBooking < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :flight, null: false, foreign_key: true
    add_column :bookings, :passenger_number, :integer
  end
end
