require "rails_helper"

RSpec.describe Passenger, type: :model do
  it { is_expected.to belong_to(:booking) }
  it "passenger factory must be valid" do
    passenger = build(:passenger)
    expect(passenger.valid?).to be true
  end
  describe ".validates_presence_of name" do
    it "passenger must have a name" do
      passenger = build(:passenger, name: "")
      expect(passenger.valid?).to be false
    end
    it "the name should be valid" do
      passenger = build(:passenger, name: "Tobi1")
      expect(passenger.valid?).to be false
    end
    it "the name should be valid" do
      passenger = build(:passenger, name: "Tobi")
      expect(passenger.valid?).to be true
    end
  end
  describe 'email validations' do
    it 'email must be present' do
      passenger = build(:passenger, email: "")
      expect(passenger.valid?).to be false
    end
    it 'email should not be too long' do
      passenger = build(:passenger, email: 'a' * 244 + '@example.com')
      expect(passenger.valid?).to be false
    end
    it 'email validation should accept only valid addresses' do
      invalid_address = 'passenger@example.@com'
      passenger = build(:passenger, email: invalid_address)
      expect(passenger.valid?).to be false
    end
  end
  describe '#before_save' do
    it 'should ensure all emails are downcased at the database level' do
      passenger_email = "PASSENGER@EXAMPLE.COM"
      passenger = build(:passenger, email: passenger_email)
      passenger.save
      expect(passenger.email).to eql passenger_email.downcase
    end
  end
  describe ".validate_phone_number" do
    it "ensures phone number is valid" do
      passenger = build(:passenger, phone_number: "--")
      expect(passenger.valid?).to be false
    end
  end
end
