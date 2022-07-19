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
          @user_favorites = Favorite.where(user_id: current_user.id)
          @favorited_gardens = []
          @user_favorites.each do |fav|
            @favorited_gardens << fav.garden
          end
          @appointments = Appointment.where(guest_id: current_user.id).or(Appointment.where(host_id: current_user.id))
          render json: {
            id: @current_user.id,
            email: @current_user.email,
            username: @current_user.username,
            description: @current_user.description,
            tools: @current_user.tools,
            appointments: @appointments,
            favorites: @favorited_gardens,
            created_at: @current_user.created_at.iso8601
          }, status: :ok
        end
      end
    end
  end
end