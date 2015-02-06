class BreweriesController < ApplicationController

  def index
    @state = State.find(params[:id])
    @breweries = @state.breweries
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
