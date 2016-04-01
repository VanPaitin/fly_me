module BookingsHelper
  def booking_params
    params.require(:booking).permit(:price,
      passengers_attributes: [:name, :email,
        :phone_number])
  end
end
