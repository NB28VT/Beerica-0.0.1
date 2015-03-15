require 'rails_helper'

feature "Navigate to state breweries page", %(
"As a user
I would like to select a state
So I can see a list of all the breweries in that state

Acceptance criteria:
[x] A user can visit a state and be brought to a state info page (JS is untested in this suite)
[x] The state page includes links to all breweries in the state
[x] A user can click on a brewery and get information on the brewery
[x] The state page includes a Google map for the state, with all brewery locations marked (JS is untested in this suite)
[x] A user can look up a town and see all of the breweries in that city
[ ] A state page includes stats on the breweries in that state
[ ] A user can search for a brewery near a specifc location
[ ] A user can search for a brewery near their current location
"
) do

  before(:each) do
    @state = FactoryGirl.create(:state)
    @city = FactoryGirl.create(:city, state_id: @state.id)
    @brewery = FactoryGirl.create(:brewery, state_id: @state.id, city: @city)
  end

  # after(:all) do
  #   @state.destroy!
  #   @city.destroy!
  #   @brewery.destroy!
  # end

  # all_breweries = []
  # This may be slowing down tests
  # Removed for now: test database is not seeded

  # Brewery.where(state_id: state_id).each do | brewery |
  #   all_breweries << brewery.name
  # end

  scenario "A user can visit a state info page", js: true do
    visit state_breweries_path(@state.id)

    expect(page).to have_content(@state.name)
  end

  scenario "A user can click on a brewery and get information on the brewery", js: true do
    visit state_breweries_path(@state.id)

    select(@brewery.name, from: 'brewery')

    expect(page).to have_content(@brewery.street_address)
  end

  scenario "The state page includes links to all breweries in the state" do
    # skipping because highmaps won't load without seeded test db
    skip
    # visit state_breweries_path(state_id)
    #
    # all_breweries.each do |brewery_name|
    #   expect(page).to have_content(brewery_name)
    # end
  end

  scenario "A user can look up a cities and see all of the breweries there", js: true do

    visit state_breweries_path(@state.id)
    select(@brewery.city.name, from: 'cities')

    expect(page).to have_content(@brewery.name)

    select(@brewery.name, from: 'breweries')

    expect(page).to have_content(@brewery.street_address)
  end
end
