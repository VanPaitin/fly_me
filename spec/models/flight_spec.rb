require "rails_helper"

RSpec.describe Flight, type: :model do
  it { is_expected.to belong_to(:from_airport).class_name("Airport") }
  it { is_expected.to belong_to(:to_airport).class_name("Airport") }
  it { is_expected.to have_many(:bookings) }
end
