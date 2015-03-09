require 'rails_helper'


feature "User tracks breweries visited", %( As a user
I would like to sign up for Beerica
So I can track which breweries I visit
Acceptance criteria:
[ ] A user can create an account on Beerica
[ ] A user can add a brewery to their list of visited breweries
[ ] A user's profile page includes a map of breweries the user has visited
) do

  scenario "A user can create an account on Beerica", js:true do
    user_count = User.count

    visit root_path
    click_on 'register'

    fill_in 'Username', with: 'bacon_pancakes123'
    fill_in 'Email', with: 'pancakes123@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    save_and_open_page

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(User.count).to eq(user_count + 1)

  end

  scenario "A user can add a brewery to their list of visited breweries" do
    skip
  end

  scenario "A user's profile page includes a map of breweries the user has visited" do
    skip
  end

end
