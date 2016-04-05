class Airport < ActiveRecord::Base
  has_many :from_flights, class_name: "Flight", foreign_key: :from_airport_id
  has_many :to_flights, class_name: "Flight", foreign_key: :to_airport_id
end
