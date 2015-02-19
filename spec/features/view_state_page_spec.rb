require 'rails_helper'

feature "Navigate to state breweries page", %(
"As a user
I would like to select a state
So I can see a list of all the breweries in that state

Acceptance criteria:
[x] A user can visit a state and be brought to a state info page (untested in this suite)
[x] The page will include links to brewery pages for each brewery
[ ] The page includes a Google map for the state, with all brewery locations
"
) do

  state_id = State.find_by(name: "Vermont").id
  brewery = Brewery.find_by(name: "Rock Art Brewery")

  scenario "A user can visit a state info page", js: true do
    visit state_breweries_path(state_id)

    expect(page).to have_content("Vermont")
  end

  scenario "The page will include URL links to brewery pages for each brewery" do
    visit state_breweries_path(state_id)

    click_on brewery.name

    expect(page).to have_content(brewery.website)
  end


end
