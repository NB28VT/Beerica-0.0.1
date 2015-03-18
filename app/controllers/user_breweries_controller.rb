class UserBreweriesController < ApplicationController

  def create
    @user_brewery = current_user.user_breweries.build(brewery_id: params[:brewery_id])
    if @user_brewery.save
      redirect_to state_brewery_path(@user_brewery.brewery.state, @user_brewery.brewery)
    end
  end
end
