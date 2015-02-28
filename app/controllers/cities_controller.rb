class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
    @breweries = @city.breweries
  end


end
