class UserBreweriesController < ApplicationController

  def create
    @user_brewery = UserBrewery.new(params[:user_brewery])
    if @user_brewery.save
      redirect_to state_brewery_path(@user_brewery.brewery)
    end
  end


  private

  def user_breweries_params
    params.require(:user_brewery).permit(:user_id, :brewery_id)
  end
end
