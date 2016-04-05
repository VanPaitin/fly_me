class BookingsController < ApplicationController
  include BookingsHelper
  before_action :set_flight_and_passengers, except: [:show, :index, :edit]
  def index
    @bookings = current_user.bookings
  end
  def new
    @booking = @flight.bookings.new
    @no_of_passengers.times { @booking.passengers.build }
  end

  def edit
    set_booking
    @flight = @booking.flight
  end

  def new_placeholder
    redirect_to new_flight_booking_path(params[:flight_id],
                                        passengers: params[:passengers])
  end

  def show
    set_booking
  end

  def create
    @booking = @flight.bookings.new(booking_params)
    @booking.user_id = current_user.id if current_user
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

  def update
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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_flight_and_passengers
    @flight = Flight.find(params[:flight_id])
    if params[:passengers]
      @no_of_passengers = params[:passengers].to_i
    else
      @no_of_passengers = params[:booking][:passengers_attributes].keys.count
    end
  end
end
