class BookingsController < ApplicationController
  include BookingsHelper
  def index
    @bookings = current_user.bookings
  end
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.new
  end

  def show
    @booking = Booking.find_by_id(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    render :new
  end

  def create
    @flight = Flight.find(params[:flight_id])
    if params[:booking] == nil
      flash[:notice] = "Please add at least one passenger"
      redirect_to :back
    else
      @booking = @flight.bookings.new(booking_params)
      @booking.price = booking_params[:passengers_attributes].keys.count * 1200
      save
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if params[:booking] == nil
      flash[:notice] = "Please add at least one passenger"
      redirect_to :back
    else
      @booking.update(booking_params)
      price_update
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "You have just deleted a booking"
    redirect_to flight_bookings_path
  end
  private
  def save
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

  def price_update
    @booking.price = @booking.passengers.count * 1200
    if @booking.save
      flash[:notice] = "This flight has been updated successfully"
      @booking.passengers.each do |passenger|
        UserMailer.updated(passenger).deliver_now
      end
      redirect_to flight_booking_path(@booking.flight, @booking)
    else
      render :new
    end
  end

end
