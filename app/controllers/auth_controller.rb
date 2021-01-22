class AuthController < ApplicationController
  def login
    user = User.login(params[:username], params[:password])
    if user.present?
      render json: {displayName: user.display_name, isAdmin: user.is_admin}, status: :created
    else
      render status: :unauthorized
    end
  end
end
