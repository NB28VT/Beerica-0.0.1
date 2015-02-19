require 'rails_helper'

RSpec.describe Map, :type => :model do

  map = Map.new
  state_count = map.state_brewery_hash.keys.count

  it "Builds a hash of breweries per capita with each state" do
    per_capita_hash = map.breweries_per_capita

    expect(per_capita_hash.keys.count).to eq(state_count)
  end
end
