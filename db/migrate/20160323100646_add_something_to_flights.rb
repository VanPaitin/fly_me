class AddSomethingToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :duration, :integer
    add_column :flights, :date, :datetime
  end
end
