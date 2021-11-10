class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :user_not_found

    # def test_endpoints
    #     render json: {current_session: session}
    # end

    def create
        user = User.find_by(username: params[:username])
        session[:uid] ||= user.id
        render json: user, status: :ok
    end

    def destroy
        session.destroy
        render status: :no_content
    end

    private

    def user_not_found
        render json: { error: "User not found!" }, status: :not_found
    end
end
