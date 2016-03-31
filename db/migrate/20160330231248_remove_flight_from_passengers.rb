class RemoveFlightFromPassengers < ActiveRecord::Migration
  def change
    remove_reference :passengers, :flight, index: true, foreign_key: true
  end
end
