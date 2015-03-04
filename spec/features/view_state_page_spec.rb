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

  state_id = State.find_by(name: "Vermont").id
  brewery = Brewery.find_by(name: "Rock Art Brewery")
  all_breweries = []

  # This may be slowing down tests
  Brewery.where(state_id: state_id).each do |brewery|
    all_breweries << brewery.name
  end

  scenario "A user can visit a state info page", js: true do
    visit state_breweries_path(state_id)

    expect(page).to have_content("Vermont")
  end

  scenario "A user can click on a brewery and get information on the brewery", js: true do
    visit state_breweries_path(state_id)

    select(brewery.name, from: 'brewery')

    expect(page).to have_content("Website")
  end

  scenario "The state page includes links to all breweries in the state" do
    visit state_breweries_path(state_id)

    all_breweries.each do |brewery_name|
      expect(page).to have_content(brewery_name)
    end
  end

  scenario "A user can look up a cities and see all of the breweries there", js: true do
    visit state_breweries_path(state_id)
    select(brewery.city.name, from: 'cities')

    expect(page).to have_content(brewery.name)

    select(brewery.name, from: 'breweries')

    expect(page).to have_content("Website")
  end
end
