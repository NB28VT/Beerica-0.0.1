require 'rails_helper'

feature "Navigate top bar", %( As a user
I would like to navigate the top bar of Beerica
So I can easily get around the website

Acceptance criteria:
[x] The home page link returns the user to the state index page
[ ] The search link brings the user to a search for breweries page
[ ] The share link lets the user share Beerica via Twitter and Facebook
[ ] The info page link brings the user to an info page
) do

  state_id = State.find_by(name: "Vermont").id

  scenario "The home page link returns the user to the state index page", js: true do
    visit state_breweries_path(state_id)

    click_on("home")
    expect(page).to have_content("Breweries per capita")
  end

  scenario "The search link brings the user to a search for breweries page", js: true do

  end

  scenario "The share link lets the user share Beerica via Twitter and Facebook", js: true do

  end

  scenario "The info page link brings the user to an info page", js: true do
    visit root_path

    click_on("info")
    expect(page).to have_content("Nathan Burgess")
  end

end
