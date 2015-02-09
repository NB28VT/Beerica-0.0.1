class StatesController < ApplicationController

  def index
    @states = State.all
  end

  # Remove template
  # def show
  #   @state = State.find(params[:id])
  # end
end
