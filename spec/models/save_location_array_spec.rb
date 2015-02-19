require 'rails_helper'

RSpec.describe BuildLocationArray, :type => :model do

  state = State.where(name: "Vermont").first
  breweries = state.breweries
  count = breweries.count

  it "Returns an array of location data for breweries" do
    array_builder = BuildLocationArray.new
    location_array = array_builder.build_locations(breweries)

    expect(location_array.count).to eq(count)
  end
end
