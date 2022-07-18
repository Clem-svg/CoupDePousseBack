module Api
  module V1
    class UsersController < ApiController
      before_action :doorkeeper_authorize!
      before_action :current_user
      respond_to    :json

      # GET /me.json
      def me
        if @current_user.nil?
          render json: { error: 'Not Authorized' }, status: :unauthorized
        else
          render json: {
            id: @current_user.id,
            email: @current_user.email,
            username: @current_user.username,
            description: @current_user.description,
            tools: @current_user.tools,
            created_at: @current_user.created_at.iso8601
          }, status: :ok
        end
      end
    end
  end
end