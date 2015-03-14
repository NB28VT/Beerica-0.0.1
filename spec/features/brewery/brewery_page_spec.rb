require 'rails_helper'

feature "Get information about brewery", %q(
As a user
I would like to see where a brewery is located
So I can visit it

Acceptance criteria:
[x] A user can visit a brewery page and see a map showing the exact location of the brewery
[ ] A user can see a picture of a brewery if one is available
[x] A user can visit a brewery's website if one is available
[ ] If a location is not available, the user will see a message
) do

  before(:all) do
    @state = FactoryGirl.create(:state)
    @brewery = FactoryGirl.create(:brewery, state_id: @state.id)
  end

  after(:all) do
    @state.destroy!
    @brewery.destroy!
  end

  scenario "A user can visit a brewery's website if one is available", js: true do
    visit state_brewery_path(@state, @brewery)

    click_link "Website"

    current_url.should == @brewery.website
  end
end
