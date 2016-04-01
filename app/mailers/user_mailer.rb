class UserMailer < ApplicationMailer
  default from: "Fly_me"
  def thanks(passenger)
    @passenger = passenger
    mail(to: @passenger.email, subject: "Booking successful")
  end
end
