require 'dotenv'
Dotenv.load

class BreweriesController < ApplicationController
  def index
    api_key = ENV['GOOGLE_MAP_API_TOKEN']
    @map_api_call = "https://maps.googleapis.com/maps/api/js?key=#{api_key}"
    @state = State.find(params[:state_id])
    @breweries = @state.breweries
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
