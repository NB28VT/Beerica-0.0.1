require 'rails_helper'

feature "Navigate top bar", %( As a user
I would like to navigate the top bar of Beerica
So I can easily get around the website

Acceptance criteria:
[ ] The home page link returns the user to the state index page
[ ] The search link brings the user to a search for breweries page
[ ] The share link lets the user share Beerica via Twitter and Facebook
[ ] The info page link brings the user to an info page
) do

  state_id = State.find_by(name: "Vermont").id

  scenario "The home page link returns the user to the state index page" do
    visit state_breweries_path(state_id)

    click_on "Home"
    expect(page).to have_content("Breweries per capita:")
  end

  scenario "The search link brings the user to a search for breweries page" do

  end

  scenario "The share link lets the user share Beerica via Twitter and Facebook" do

  end

  scenario "The info page link brings the user to an info page" do

  end

end
