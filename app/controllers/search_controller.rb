class SearchController < ApplicationController
  def index
    if params[:query].present?
      @brewery_results = Brewery.search(params[:query], page: params[:page])
    end
  end
end
