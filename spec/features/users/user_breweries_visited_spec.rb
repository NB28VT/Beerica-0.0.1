require 'rails_helper'

feature "User tracks breweries visited", %( As a user
I would like to sign up for Beerica
So I can track which breweries I visit
Acceptance criteria:
[ ] A user can create an account on Beerica
[ ] A user can add a brewery to their list of visited breweries
[ ] A user's profile page includes a map of breweries the user has visited
[ ] A user must be signed in to add a visited brewery
[ ] A user can't add the same brewery twice
) do

  scenario "A user can create an account on Beerica", js: true do
    # FactoryGirl build user instead of save to DB here
    user = FactoryGirl.build(:user)

    user_count = User.count
    visit new_user_registration_path

    fill_in 'Username', with: user.username
    fill_in 'Email', with:  user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(User.count).to eq(user_count + 1)

    # Despite database cleaner, selenium may be causing persisiting user.
    # Manually destroying for now.
    User.first.destroy!
  end

  # User created with sign in is persisted here

  scenario "A user can add a brewery to their list of visited breweries", js: true do
    skip
    # new_user = FactoryGirl.create(:user)
    # state = FactoryGirl.create(:state)
    # brewery = FactoryGirl.create(:brewery, state_id: state.id)
    #
    # login_as(new_user, scope: new_user, run_callbacks: false)
    #
    # visit state_brewery_path(state, brewery)
    #
    # click_on "I visited this brewery"
    #
    # # expect(page).to have_content('Brewery added!')
    # expect(user.breweries).to eq(1)
  end

  scenario "A user can't add the same brewery twice" do
    skip
  end

  scenario "A user must be signed in to add a visited brewery" do
    skip
  end

  scenario "A user's profile page includes a map of breweries the user has visited" do
    skip
  end
end
