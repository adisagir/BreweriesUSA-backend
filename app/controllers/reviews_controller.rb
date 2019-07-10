class ReviewsController < ApplicationController
  def index
    reviews = Review.all
    render json: reviews
  end

  def show
    review = Review.find(params[:id])
    render json: review
  end

  def create
    review = Review.create(params[:review])
    render json: review
  end
end
