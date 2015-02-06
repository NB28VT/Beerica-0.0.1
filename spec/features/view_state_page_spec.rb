require 'rails_helper'

feature "Navigate to state breweries page", %(
"As a user
I would like to select a state
So I can see a list of all the breweries in that state

Acceptance criteria:
[ ] A user can click on a state and be brought to a state info page
[ ] The page will include links to brewery pages for each brewery
[ ] The page includes a Google map for the state, with all brewery locations
"
) do

  before(:each) do
    @state = FactoryGirl.create(:state, name: "Vermont")
  end

  scenario "A user can click on a state and be brought to a state info page" do
    visit states_path

    click_on @state.name

    expect(page).to have_content(@state.name)
  end

end
