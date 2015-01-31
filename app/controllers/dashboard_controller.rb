class DashboardController < ApplicationController

  def index
    loader = BreweryLoader.new
    @breweries = loader.get_breweries
    binding.pry
  end

end
