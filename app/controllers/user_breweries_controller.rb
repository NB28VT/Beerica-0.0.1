class UserBreweriesController < ApplicationController

  def create
  end



  private

  def user_breweries_params
    params.require(:user_brewery).permit(:user_id, :brewery_id)
  end
end
