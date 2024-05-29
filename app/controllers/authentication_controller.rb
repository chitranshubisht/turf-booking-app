class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      render json: { user:, token: user.generate_jwt }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def signup
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      render json: { user:, token: user.generate_jwt }
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
