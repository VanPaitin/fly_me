require "rails_helper"

RSpec.describe Booking, type: :model do
  it { is_expected.to belong_to (:flight) }
  it { is_expected.to belong_to (:user)}
  it { is_expected.to have_many(:passengers) }
  it { is_expected.to accept_nested_attributes_for :passengers }
  describe ".validate_presence_of_flight_id" do
    it "must have a flight_id" do
      booking = build(:booking, flight_id: nil)
      expect(booking.valid?).to be false
    end
  end

end
