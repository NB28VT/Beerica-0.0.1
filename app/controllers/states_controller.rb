class StatesController < ApplicationController

  def index
    map = Map.new
    @per_capita_hash = map.breweries_per_capita
    @states = State.all
  end

  # Remove template
  # def show
  #   @state = State.find(params[:id])
  # end
end
