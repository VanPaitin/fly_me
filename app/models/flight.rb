class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"
  has_many :bookings
  class << self
    def date_list
      dates = Flight.all.order(date: :asc)
      dates.map do |flight|
        flight.date.strftime("#{flight.date.day.ordinalize} %B %Y")
      end.uniq
    end

    def search(depart, dest, date)
      Flight.where(from_airport_id: depart,
                   to_airport_id: dest,
                   date: Flight.correct_date(date))
    end

    def correct_date(date)
      unless date.nil?
        date = date.to_date
        date.beginning_of_day..date.end_of_day
      end
    end
  end
end
