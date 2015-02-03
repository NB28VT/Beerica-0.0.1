class DashboardController < ApplicationController

  def index
    map = Map.new
    @per_capita_hash = map.breweries_per_capita
  end

end
