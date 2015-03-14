class SearchController < ApplicationController
  def index
    binding.pry
    if params[:search]
      @brewery_results = Brewery.search(params[:search]).order("created_at DESC")
    end
  end
end
