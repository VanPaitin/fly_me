require "rails_helper"

RSpec.describe Airport, type: :model do
  context "it should have many fligths" do
    it "has many departure flights" do
      is_expected.to have_many(:from_flights).class_name("Flight").
        with_foreign_key(:from_airport_id)
    end
    it "has many destination flights" do
      is_expected.to have_many(:to_flights).class_name("Flight").
        with_foreign_key(:to_airport_id)
    end
  end
end
