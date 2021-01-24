class AuthController < ApplicationController
  def login
    @user = User.find_by(user_name: params[:username])
    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode({user_id: @user.id})
      render json: {displayName: @user.display_name, isAdmin: @user.is_admin, userId: @user.id, token: token}, status: :created
    else
      render status: :unauthorized
    end
  end
end
