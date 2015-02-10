require 'dotenv-rails'
class BreweriesController < ApplicationController


  def index
    Dotenv.load

    api_key = ENV['GOOGLE_MAP_API_KEY_TOKEN']
    @map_api_call = "https://maps.googleapis.com/maps/api/js?key=#{api_key}"
    binding.pry
    @state = State.find(params[:state_id])
    @breweries = @state.breweries
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
