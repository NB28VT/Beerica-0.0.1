class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @breweries = @city.breweries.sort_by &:name
    location_builder = BuildLocationArray.new
    @brewery_location_array = location_builder.build_locations(
    @breweries
    ).to_json
  end
end
