require 'dotenv'
Dotenv.load

class BreweriesController < ApplicationController
  def index
    api_key = ENV['GOOGLE_MAP_API_TOKEN']
    @map_api_call = "https://maps.googleapis.com/maps/api/js?key=#{api_key}"
    @state = State.find(params[:state_id])
    @breweries = @state.breweries.sort_by &:name
    @cities = @state.cities.sort_by &:name
    location_builder = BuildLocationArray.new
    @brewery_location_array = location_builder.build_locations(
    @breweries
    ).to_json
  end

  def show
    @brewery = Brewery.find(params[:id])
    @user_brewery = UserBrewery.new
  end

  def redirect
    redirect_to state_brewery_path(params[:id])
  end
end
