class UserMailer < ApplicationMailer
  default from: "Fly_me"
  def thanks(passenger)
    @passenger = passenger
    mail(to: @passenger.email, subject: "Booking successful")
  end
  def updated(passenger)
    @passenger = passenger
    mail(to: @passenger.email, subject: "Successfully updated bookings")
  end
end
