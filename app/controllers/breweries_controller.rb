class BreweriesController < ApplicationController

  def index
    @state = State.find(params[:state_id])
    @breweries = @state.breweries
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
