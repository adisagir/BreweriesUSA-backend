class ReviewsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create, :index, :show]
  def index
    reviews = Review.all
    render json: reviews
  end

  def show
    review = Review.find(params[:id])
    render json: review
  end

  def create
    review = Review.create(review_params)
    render json: review
  end

  private

  def review_params
    params.permit(:user_id, :brewery_id, :content, :stars, :image, :name)
  end
end
