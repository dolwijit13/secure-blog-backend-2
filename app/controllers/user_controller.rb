class UserController < ApplicationController
    def getUsers
        users = User.all
        render json: users.as_json
    end

    def getUserById
        user = User.find(params[:id]) rescue nil
        if user.present?
            render json: user.as_json
        else
            render json: { status: 404, error: 'Not found'}, status: :not_found
        end
    end

    def createUser
        puts params
        user = User.new(display_name: params[:displayName], user_name: params[:userName], password: params[:password])
        user.is_admin = false
        if user.save
            render json: {displayName: user.display_name, userId: user.id}, status: :created
        else
            render status: :bad_request
        end
    end
end