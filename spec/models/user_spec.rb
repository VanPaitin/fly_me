require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(name: 'Example User', email: 'user@example.com',
             )
  end
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
  describe 'email validations' do
    it 'email must be present' do
      user.email = ''
      expect(user.valid?).to be false
    end
    it 'email should not be too long' do
      user.email = 'a' * 244 + '@example.com'
      expect(user.valid?).to be false
    end
    it 'email validation should accept only valid addresses' do
      valid_address = 'user@example.@com'
      user.email = valid_address
      expect(user.valid?).to be false
    end
    it 'email must be unique' do
      duplicate_user = user.dup
      user.save
      expect(duplicate_user.valid?).to be false
    end
    it 'uniqueness should take care of case-insensitivity' do
      duplicate_user = user.dup
      duplicate_user.email = 'USER@EXAMPLE.COM'
      user.save
      expect(duplicate_user.valid?).to be false
    end
  end
  describe '#before_save' do
    it 'should ensure all emails are downcased at the database level' do
      user.email = 'USER@EXAMPLE.COM'
      user.save
      expect(user.email).to eql 'user@example.com'
    end
  end
  describe '.has_secure_password' do
    it "password should be present (nonblank)" do
      user.password = user.password_confirmation = " " * 6
      expect(user.valid?).to be false
    end
    it "should have a minimum length" do
      user.password = user.password_confirmation = "a" * 5
      expect(user.valid?).to be false
    end
  end
end
