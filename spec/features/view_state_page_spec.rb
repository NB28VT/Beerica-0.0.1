require 'rails_helper'

feature "Navigate to state breweries page", %(
"As a user
I would like to select a state
So I can see a list of all the breweries in that state

Acceptance criteria:
[x] A user can visit a state and be brought to a state info page (JS is untested in this suite)
[ ] The state page includes links to all breweries in the state
[x] A user can click on a brewery and get information on the brewery
[x] The state page includes a Google map for the state, with all brewery locations marked (JS is untested in this suite)
"
) do

  state_id = State.find_by(name: "Vermont").id
  brewery = Brewery.find_by(name: "Rock Art Brewery")
  all_breweries = []

  Brewery.where(state_id: state_id).each do |brewery|
    all_breweries << brewery.name
  end

  scenario "A user can visit a state info page", js: true do
    visit state_breweries_path(state_id)

    expect(page).to have_content("Vermont")
  end

  scenario "A user can click on a brewery and get information on the brewery" do
    visit state_breweries_path(state_id)

    click_on brewery.name

    expect(page).to have_content(brewery.website)
  end

  scenario "The state page includes a Google map for the state, with all brewery locations marked", js: true do
    visit state_breweries_path(state_id)

    all_breweries.each do |brewery_name|
      expect(page).to have_content(brewery_name)
    end
  end



end
