class Airport < ActiveRecord::Base
  has_many :from_airports, class_name: "Flight"
  has_many :to_airports, class_name: "Flight"
  def to_s
    "#{name}, #{city}"
  end
end
