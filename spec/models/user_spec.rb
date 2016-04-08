require "rails_helper"
require_relative "../support/omniauth_helper"
RSpec.describe User, type: :model do
  include OmniauthHelper
  it { is_expected.to have_many(:bookings) }
  describe ".validate_name" do
    it "should be valid" do
      user = build(:user)
      expect(user.valid?).to be true
    end
    it "user name must be present" do
      user = build(:user, name: "")
      expect(user.valid?).to be false
    end
    it "name should not be too long" do
      user = build(:user, name: "a" * 51)
      expect(user.valid?).to be false
    end
    it "must not contain invalid characters" do
      user = build(:user, name: "Tobi1")
      expect(user.valid?).to be false
    end
  end
  describe ".validate_uid" do
    it "uid must be present" do
      user = build(:user, uid: nil)
      expect(user.valid?).to be false
    end
  end
  describe ".validate_provider" do
    it "authentication provider must be present" do
      user = build(:user, provider: nil)
      expect(user.valid?).to be false
    end
  end
  describe ".from_omniauth" do
    it "can find or create a user" do
      expect(User.all.count).to eql 0
      User.from_omniauth(authenticator)
      expect(User.all.count).to eql 1
      User.from_omniauth(authenticator)
      expect(User.all.count).to eql 1
    end
  end
end
