module BookingsHelper
  def booking_params
    params.require(:booking).permit(passengers_attributes: [:id, :name, :email,
                                    :phone_number, :_destroy ])
  end
end
