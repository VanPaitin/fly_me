class AddFlightIdToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :flight, index: true, foreign_key: true
  end
end
