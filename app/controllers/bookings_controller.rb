class BookingsController < ApplicationController
  include BookingsHelper
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.new
    @no_of_passengers = params[:passengers].to_i
    @no_of_passengers.times { @booking.passengers.build }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "This flight has been booked successfully"

      redirect_to booking_path(@booking)
    else
      render new
    end
  end
end
