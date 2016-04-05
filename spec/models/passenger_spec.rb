require "rails_helper"

RSpec.describe Passenger, type: :model do
  let(:passenger) do
    Passenger.new(name: 'Example User', email: 'user@example.com',
                  phone_number: '+234 807 930 3489')
  end
  it { is_expected.to belong_to(:booking) }
  describe ".validates_presence_of name" do
    it "passenger must have a name" do
      passenger.name = ""
      expect(passenger.valid?).to be false
    end
    it "the name should be valid" do
      passenger.name = "Tobi1"
      expect(passenger.valid?).to be false
    end
  end
  describe 'email validations' do
    it 'email must be present' do
      passenger.email = ''
      expect(passenger.valid?).to be false
    end
    it 'email should not be too long' do
      passenger.email = 'a' * 244 + '@example.com'
      expect(passenger.valid?).to be false
    end
    it 'email validation should accept only valid addresses' do
      valid_address = 'passenger@example.@com'
      passenger.email = valid_address
      expect(passenger.valid?).to be false
    end
  end
  describe '#before_save' do
    it 'should ensure all emails are downcased at the database level' do
      passenger.email = 'passenger@EXAMPLE.COM'
      passenger.save
      expect(passenger.email).to eql 'passenger@example.com'
    end
  end
end
