class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map do |airport|
      [(airport.name + ", " + airport.city), airport.id]
    end
    set_variables
    if params[:commit] == "Search"
      if params[:from_airport_id] == params[:to_airport_id]
        flash[:danger] = "Your Departure and Destination Airports Can Not Be the Same"
      end
    end
  end
  private
    def set_variables
      @dates = Flight.date_list
      @passenger_options = [1,2,3,4]
      @from_airport_code = params[:from_airport_id]
      @to_airport_code = params[:to_airport_id]
      @date = params[:date]
      @passengers = params[:passengers]
      @flights = Flight.search(params[:from_airport_id], params[:to_airport_id], params[:date])
    end
end
