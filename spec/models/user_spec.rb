require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(name: 'Example User', email: 'user@example.com')
  end
  it { is_expected.to have_many(:bookings) }
  it 'should be valid' do
    expect(user.valid?).to be true
  end
  it 'user name must be present' do
    user.name = ''
    expect(user.valid?).to be false
  end
  it 'name should not be too long' do
    user.name = 'a' * 51
    expect(user.valid?).to be false
  end
  describe ".from_omniauth" do
    context "it should " do
    end
  end
end
