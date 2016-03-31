class BookingsController < ApplicationController
  include BookingsHelper

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @booking.flight_id = @flight.id
    @no_of_passengers = params[:passengers].to_i
    @no_of_passengers.times { @booking.passengers.build }
  end

  def new_placeholder
    redirect_to new_flight_booking_path(params[:flight_id],
      passengers: params[:passengers])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight_id = params[:flight_id]
    if @booking.save
      flash[:notice] = "This flight has been booked successfully"
      redirect_to flight_booking_path(@booking.flight, @booking)
    else
      render :new
    end
  end
end
