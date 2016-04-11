require "rails_helper"

RSpec.describe Flight, type: :model do
  before(:all) do
    Flight.delete_all
  end
  it { is_expected.to belong_to(:from_airport).class_name("Airport") }
  it { is_expected.to belong_to(:to_airport).class_name("Airport") }
  it { is_expected.to have_many(:bookings) }
  it { is_expected.to validate_presence_of(:from_airport_id) }
  it { is_expected.to validate_presence_of(:to_airport_id) }
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
  describe ".correct_date" do
    it "can convert a date string to a date range" do
      sample_date = Time.now.to_s
      real_date = sample_date.to_date
      expect(Flight.correct_date(sample_date)).to eql real_date.
        beginning_of_day..real_date.end_of_day
    end
  end
end
