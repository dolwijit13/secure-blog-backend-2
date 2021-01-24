class UsersController < ApplicationController
    before_action :authorize_request, except: :create

    def index
        users = User.all
        render json: users.as_json
    end

    def show
        user = User.find(params[:id]) rescue nil
        if user.present?
            render json: user.as_json
        else
            render json: { status: 404, error: 'Not found'}, status: :not_found
        end
    end

    def create
        @user = User.new(display_name: params[:displayName], user_name: params[:userName], password: params[:password])
        @user.is_admin = false
        if @user.save
            token = JsonWebToken.encode({user_id: @user.id})
            render json: {displayName: @user.display_name, userId: @user.id, token: token}, status: :created
        else
            render status: :bad_request
        end
    end
end