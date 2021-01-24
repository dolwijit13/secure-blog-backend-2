class AuthController < ApplicationController
  def login
    @user = User.login(params[:username], params[:password])
    token = JsonWebToken.encode({user_id: @user.id})
    if user.present?
      render json: {displayName: user.display_name, isAdmin: user.is_admin, userId: user.id}, status: :created
    else
      render status: :unauthorized
    end
  end
end
