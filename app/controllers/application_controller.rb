class ApplicationController < ActionController::API
  before_action :authenticate_user
  def encode_token(payload)
    JWT.encode payload, secret, 'HS256'
  end

  def user_payload(user)
    { user_id: user.id }
  end

  def secret
    Rails.application.credentials.my_app_secret
  end

  def token
    request.headers["Authorization"].split(" ")[1] if request.headers["Authorization"]
  end

  def decoded_token
    JWT.decode token, secret, true, { algorithm: 'HS256' } if token
  end

  def current_user
    User.find(decoded_token[0]["user_id"]) if decoded_token
  end

  def authenticate_user
    render json: {error: "Please login to do this"} unless current_user
  end
end
