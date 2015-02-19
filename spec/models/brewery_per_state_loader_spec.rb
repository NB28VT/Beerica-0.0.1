require 'rails_helper'

# CAN'T TEST THIS IT HITS THE API LIMIT

RSpec.describe BreweryPerStateLoader, :type => :model do

  # it "Returns a hash of states with breweries per capita" do
  #
  #   loader = BreweryPerStateLoader.new
  #   brewery_hash = loader.breweries_per_capita
  #   states = State.all
  #   state_names = []
  #   states.each do |state|
  #     state_names << state.name
  #   end
  #
  #   state_names.each do |state|
  #     binding.pry
  #     expect(brewery_hash.keys).to_include(state)
  #   end
  # end
end
