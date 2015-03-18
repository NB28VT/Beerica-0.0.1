require 'rails_helper'

feature "Search for brewery", %(
As a user
I would like to search for a brewery by name
So that I can look up its information quickly
Acceptance criteria:
[ ] A user can visit the search page, look up a brewery and get to the brewery's page
) do

  before(:each) do
    @state = FactoryGirl.create(:state)
    @city = FactoryGirl.create(:city, state_id: @state.id)
    @brewery = FactoryGirl.create(:brewery, state_id: @state.id, city: @city)
  end

  scenario "A user can visit the search page, look up a brewery and get to the brewery's page" do
    state = @state
    brewery = @brewery
    visit root_path

    click_on "search"
    fill_in("search", with: "Rock Art Brewery")
    click_on "search-form"
    click_on "Rock Art Brewery"

    current_path.should == state_brewery_path(state, brewery)
  end
end
