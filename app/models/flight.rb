class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"
  has_many :bookings
  validates :to_airport_id, presence: true
  validates :from_airport_id, presence: true
  class << self
    def date_list
      dates = all.order(date: :asc)
      dates.map do |flight|
        flight.date.strftime("#{flight.date.day.ordinalize} %B %Y")
      end.uniq
    end

    def search(hash)
      hash[:date] = correct_date(hash[:date])
      where(hash)
    end

    def correct_date(date)
      unless date.nil?
        date = date.to_date
        date.beginning_of_day..date.end_of_day
      end
    end
  end
end
