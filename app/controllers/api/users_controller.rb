class Api::UsersController < ApplicationController
  skip_before_action :set_current_user, :authenticate_request, only: :create

  def index
    if params[:me].present?
      users = User.find(@current_user.id)
    else
      users = User.all
    end
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { error: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
