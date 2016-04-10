require "rails_helper"

RSpec.describe Flight, type: :feature do # , js: true
  before(:all) do
    Airport.destroy_all
    @flight = create(:flight)
  end

  describe "should contain the site name and a basic instruction" do
    before do
      visit "/"
    end
    it { expect(page).to have_content "Fly_me" }
    it { expect(page).to have_content "Search for a flight" }
  end
  describe "should have three select boxes" do
    before do
      visit root_path
      airport = Airport.first
      airport2 = Airport.second
      select(airport.name, from: "from_airport_id")
      select(airport2.name, from: "to_airport_id")
      select(@flight.date.strftime("#{@flight.date.day.ordinalize} %B %Y"),
             from: "date")
      click_button "Search"
    end
    it { expect(current_path).to eql flights_path }
    it { expect(page).to have_content "Choose a flight" }
    it { expect(page).to have_content "Flight No:" }
    it { expect(page).to have_selector(:link_or_button, 'Continue')}
  end
end
