require "rails_helper"

RSpec.describe Flight, type: :model do
  it { is_expected.to belong_to(:from_airport).class_name("Airport") }
  it { is_expected.to belong_to(:to_airport).class_name("Airport") }
  it { is_expected.to have_many(:bookings) }
  describe ".date_list" do
    it "should return an array of dates" do
      initial_time = Time.now
      final_time = Time.now + (20 * 24 * 3600)
      initial_flight = create(:flight, date: final_time)
      final_flight = create(:flight, date: initial_time)
      formatted_initial_date = initial_flight.date.
                               strftime("#{initial_flight.date.day.
                                        ordinalize} %B %Y")
      formatted_final_date = final_flight.date.
                             strftime("#{final_flight.date.day.
                                      ordinalize} %B %Y")
      expect(Flight.date_list).to eql [formatted_final_date,
                                       formatted_initial_date]
    end
  end
end
