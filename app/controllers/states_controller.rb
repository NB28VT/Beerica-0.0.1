class StatesController < ApplicationController
  def index
    map = Map.new
    @per_capita_hash = map.breweries_per_capita

    if State.count == 51
      @states = State.all
    end
  end
end
