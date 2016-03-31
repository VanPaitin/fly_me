class AddFlightAndBookingToPassenger < ActiveRecord::Migration
  def change
    add_reference :passengers, :flight, index: true, foreign_key: true
    add_reference :passengers, :booking, index: true, foreign_key: true
  end
end
