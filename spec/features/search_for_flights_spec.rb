require "rails_helper"

RSpec.describe Flight, type: :feature do
  it "should contain the site name and a basic instruction" do
    create(:flight)
    visit "/"
    expect(page).to have_content "Fly_me"
    expect(page).to have_content "Search for a flight"
  end
  it "should have for input fields" do
  end
end
