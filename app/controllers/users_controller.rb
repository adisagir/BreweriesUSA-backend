class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.valid?
      render json: { token: encode_token(user_payload(user)) }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def index
    users = User.all
    render json: users
  end

  def profile
    render json: current_user
  end

  private

  def user_params
    params.permit(:username, :password, :name, :avatar)
  end
end
