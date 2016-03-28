class BookingsController < ApplicationController
  include BookingsHelper
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @passengers = params[:passengers]
  end

  def show
  end

  def create
  end
end
