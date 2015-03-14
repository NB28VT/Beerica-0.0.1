class SearchController < ApplicationController
  def index
    if params[:search]
      @breweries = Brewery.search(params[:search]).order("created_at DESC")
    end
  end
end
