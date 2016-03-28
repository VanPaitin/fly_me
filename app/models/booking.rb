class Booking < ActiveRecord::Base
  belongs_to :flight
  belongs_to :passenger
  has_many :passenger_bookings
  accepts_nested_attributes_for :passenger
  validates :flight_id, presence: true
end
