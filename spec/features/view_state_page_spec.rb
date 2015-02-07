require 'rails_helper'

feature "Navigate to state breweries page", %(
"As a user
I would like to select a state
So I can see a list of all the breweries in that state

Acceptance criteria:
[x] A user can click on a state and be brought to a state info page
[ ] The page will include links to brewery pages for each brewery
[ ] The page includes a Google map for the state, with all brewery locations
"
) do

  before(:each) do
    @state = FactoryGirl.create(:state, name: "Vermont")
    @brewery = FactoryGirl.create(:brewery, state_id: @state.id)
  end

  scenario "A user can click on a state and be brought to a state info page" do
    visit states_path

    save_and_open_page

    binding.pry

    click_on @state.name

    expect(page).to have_content(@state.name)
  end

  scenario "The page will include links to brewery pages for each brewery" do
    visit state_breweries_path(@state)

    click_on @brewery.name

    expect(page).to have_content(@brewery.website)
  end


end
