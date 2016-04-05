class BookingsController < ApplicationController
  include BookingsHelper
  before_action :set_flight_and_passengers, except: [:show]
  def new
    @booking = @flight.bookings.new
    @booking.user_id = current_user.id
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
    @booking = @flight.bookings.new(booking_params)
    if @booking.save
      flash[:notice] = "This flight has been booked successfully"
      @booking.passengers.each do |passenger|
        UserMailer.thanks(passenger).deliver_now
      end
      redirect_to flight_booking_path(@booking.flight, @booking)
    else
      render :new
    end
  end

  private

  def set_flight_and_passengers
    @flight = Flight.find(params[:flight_id])
    if params[:passengers]
      @no_of_passengers = params[:passengers].to_i
    else
      @no_of_passengers = params[:booking][:passengers_attributes].keys.count
    end
  end
end
