require "rails_helper"

RSpec.describe Flight, type: :feature, js: true do
  before(:all) do
    Airport.destroy_all
    @flight = create(:flight)
  end

  it "should contain the site name and a basic instruction" do
    # @flight = create(:flight)
    visit "/"
    expect(page).to have_content "Fly_me"
    expect(page).to have_content "Search for a flight"
  end
  it "should go to the flights controller" do
    visit root_path
    click_button "Search"
    expect(current_path).to eql flights_path
  end
  describe "should have three select boxes" do
    before do
      visit root_path
      airport = Airport.first
      airport2 = Airport.second
      binding.pry
      select(airport.name, from: "from_airport_id")
      select(airport2.name, from: "to_airport_id")
      select(@flight.date.strftime("#{@flight.date.day.ordinalize} %B %Y"),
        from: "date")
      click_button "Search"
    end
    it { expect(page).to have_content "Choose a flight" }
    it { expect(page).to have_content "Flight No:" }
  end
end
