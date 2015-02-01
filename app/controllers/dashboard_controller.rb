class DashboardController < ApplicationController

  def index
    loader = PopulationLoader.new
    @per_capita_hash = loader.breweries_per_capita
  end

end
