class AddSomeToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :time, :string
  end
end
