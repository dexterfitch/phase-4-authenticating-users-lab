class UsersController < ApplicationController
    def show
        current_user = User.find(session[:uid])
        render json: current_user, status: :ok
    end
end
