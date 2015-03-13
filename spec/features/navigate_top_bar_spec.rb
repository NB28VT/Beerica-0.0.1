require 'rails_helper'

feature "Navigate top bar", %( As a user
I would like to navigate the top bar of Beerica
So I can easily get around the website

Acceptance criteria:
[x] The home page link returns the user to the state index page
[ ] The search link brings the user to a search for breweries page
[ ] The share link lets the user share Beerica via Twitter and Facebook
[x] The info page link brings the user to an info page
) do

  before(:each) do
    @state = FactoryGirl.create(:state)
    @brewery = FactoryGirl.create(:brewery, state: @state)
  end

  scenario "The home page link returns the user to the state index page", js: true do
    skip
    # Shut off because root is dependent on seeded db
    # visit state_breweries_path(state.id)
    #
    # click_on("home")
    # current_url.should == root_path
  end

  scenario "The search link brings the user to a search for breweries page", js: true do
    skip
  end

  scenario "The share link lets the user share Beerica via Twitter and Facebook", js: true do
    skip
  end

  scenario "The info page link brings the user to an info page", js: true do
    visit state_brewery_path(@brewery.state, @brewery)

    click_on("info")
    expect(page).to have_content("Nathan Burgess")
  end

end
