class BreweriesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show]
  def index
    if current_user
    render json: current_user.breweries
    else
      breweries = Brewery.all
      render json: breweries
    end
  end

  def show
    brewery = Brewery.find(params[:id])
    render json: brewery
  end
end
