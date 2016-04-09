class FlightsController < ApplicationController
  before_action :same_airport, only: :index
  def index
    @airports = Airport.all.map do |airport|
      [(airport.name + ", " + airport.city), airport.id]
    end
    set_variables
  end

  private

  def set_variables
    @dates = Flight.date_list
    @hash = params.permit(:from_airport_id, :to_airport_id, :date)
    @flights = Flight.search(@hash)
  end

  def same_airport
    if params[:commit] == "Search"
      if params[:from_airport_id] == params[:to_airport_id]
        flash[:danger] = "Your Departure and Destination "\
        "Airports Can Not Be the Same"
      end
    end
  end
end
