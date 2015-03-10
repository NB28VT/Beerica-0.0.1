require 'rails_helper'


feature "User tracks breweries visited", %( As a user
I would like to sign up for Beerica
So I can track which breweries I visit
Acceptance criteria:
[ ] A user can create an account on Beerica
[ ] A user can add a brewery to their list of visited breweries
[ ] A user's profile page includes a map of breweries the user has visited
[ ] A user must be signed in to add a visited brewery
) do

  brewery = Brewery.first
  state_id = brewery.state_id

  # FactoryGirl build user instead of save to DB here
  user = FactoryGirl.build(:user)

  scenario "A user can create an account on Beerica", js:true do
    user_count = User.count

    visit root_path
    click_on 'register'

    fill_in 'Username', with: user.username
    fill_in 'Email', with:  user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(User.count).to eq(user_count + 1)
  end

  scenario "A user can add a brewery to their list of visited breweries" do
    visit state_brewery_path(state_id, brewery.id)

    click_on "Add to my breweries"

    expect(page).to have_content('Brewery added!')
    expect(user.breweries).to eq(1)
  end

  scenario "A user must be signed in to add a visited brewery" do
    skip
  end

  scenario "A user's profile page includes a map of breweries the user has visited" do
    skip
  end

end
