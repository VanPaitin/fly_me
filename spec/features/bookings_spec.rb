require "rails_helper"
require_relative "../support/omniauth_helper"
def clicks
  click_button "Search"
  click_button "Continue"
end
RSpec.describe Booking, type: :feature do
  include OmniauthHelper
  before(:all) do
    Airport.destroy_all
    Flight.destroy_all
    Booking.destroy_all
    @flight = create(:flight)
  end
  describe "anonymous user" do
    context "book flight with valid passenger detail", js: true do
      before(:each) do
        visit root_path
        airport = Airport.first
        airport2 = Airport.second
        select(airport.name, from: "from_airport_id")
        select(airport2.name, from: "to_airport_id")
      end
      it "should route to the right path" do
        clicks
        expect(current_path).to eql new_booking_path
      end
      it "should have the right button" do
        clicks
        expect(page).to have_selector(:link_or_button, "Book Flight")
      end
      it "cannot make a booking without passengers" do
        clicks
        click_on "Book Flight"
        expect(page).to have_content("Please add at least one passenger")
      end
      it "should successfully book a form" do
        clicks
        click_link "Add Passenger"
        fill_in "Name:", with: "Mayowa Pitan"
        fill_in "Email:", with: "mayowa.pitan@andela.com"
        fill_in "Phone", with: "+234 8079303489"
        click_button "Book Flight"
        expect(page).to have_content(
          "Your Flight has Been Booked! Here are your flight details below")
      end
    end
  end
  describe "registered users" do
    context "can book flight with valid passenger detail", js: true do
      before(:each) do
        visit root_path
        click_on "Facebook"
        set_valid_omniauth
      end
      it { expect(page).to have_content("Welcome,") }
      it { expect(page).to have_content("Log Out") }
      it { expect(page).to have_content("Manage/View Past bookings") }
      it "can log out successfully" do
        click_on "Log Out"
        expect(page).to have_content("You have logged out successfully")
      end
    end
  end
end
