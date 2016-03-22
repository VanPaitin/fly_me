class Airport < ActiveRecord::Base
  has_many :from_airport, class_name: "Flight"
  has_many :to_airport, class_name: "Flight"
end
