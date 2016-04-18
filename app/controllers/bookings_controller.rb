class BookingsController < ApplicationController
  before_action :ensure_login, only: :index
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
    if params[:booking].nil?
      flash[:notice] = "Please add at least one passenger"
      redirect_to :back
    else
      set_price
    end
  end

  def update
    @booking = Booking.find(params[:id])
    a = params[:booking][:passengers_attributes].values
    passenger_integrity(a)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "You have just deleted a booking"
    redirect_to flight_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(passengers_attributes: [:id, :name, :email,
                                                            :phone_number,
                                                            :_destroy])
  end

  def set_price
    @booking = @flight.bookings.new(booking_params)
    @booking.price = booking_params[:passengers_attributes].keys.count * 1200
    save
  end

  def save
    @booking.user_id = current_user.id if current_user
    if @booking.save
      flash[:notice] = "This flight has been booked successfully"
      thanks_mail
    else
      @flight = @booking.flight
      render :new
    end
  end

  def passenger_integrity(a)
    if a.all? { |i| i.values[3] != "false" }
      flash[:notice] = "Please add at least one passenger"
      redirect_to :back
    else
      @booking.update(booking_params)
      price_update
    end
  end

  def thanks_mail
    @booking.passengers.each do |passenger|
      UserMailer.thanks(passenger).deliver_now
    end
    redirect_to flight_booking_path(@booking.flight, @booking)
  end

  def price_update
    @booking.price = @booking.passengers.count * 1200
    if @booking.save
      flash[:notice] = "This flight has been updated successfully"
      mail_update
    else
      @flight = @booking.flight
      render :new
    end
  end

  def mail_update
    @booking.passengers.each do |passenger|
      UserMailer.updated(passenger).deliver_now
    end
    redirect_to flight_booking_path(@booking.flight, @booking)
  end
  
  def ensure_login
    unless current_user
      flash[:notice] = "Please log in first"
      redirect_to root_path
    end
  end
end
