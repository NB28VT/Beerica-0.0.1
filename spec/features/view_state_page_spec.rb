require 'rails_helper'

feature "Navigate to state breweries page", %(
"As a user
I would like to select a state
So I can see a list of all the breweries in that state

Acceptance criteria:
[x] A user can click on a state and be brought to a state info page
[x] The page will include links to brewery pages for each brewery
[x] The page includes a Google map for the state, with all brewery locations
"
) do

  scenario "A user can click on a state and be brought to a state info page" do
    visit states_path

    save_and_open_page

    click_on "highcharts-name-vermont highcharts-key-us-vt"

    expect(page).to have_content("Vermont")
  end

  scenario "The page will include links to brewery pages for each brewery" do
    visit state_breweries_path(@state.id)

    click_on @brewery.name

    expect(page).to have_content(@brewery.website)
  end


end
