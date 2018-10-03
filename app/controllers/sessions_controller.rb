class SessionsController < ApplicationController
  skip_before_action :set_current_user, :authenticate_request

  def login
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)

      render json: { access_token: token }
    else
      render json: { errors: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
