# frozen_string_literal: true

module Api
  module V1
    class FavoritesController < ApiController
      before_action :doorkeeper_authorize!, only: %i[destroy]
      before_action :find_garden
      before_action :find_favorite, only: [:destroy]

      def create
        if already_liked?
          render json: {error: "Already liked"}, status: :unprocessable_entity
        else
          @favorite = @garden.favorites.create(user_id: current_user.id)
          render json: @favorite
        end
      end

      def destroy
        if !already_liked?
          render json: "Like ne peut pas être supprimé"
        else
          @favorite.destroy
        end
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      def find_favorite
        @favorite = @garden.favorites.find(params[:id])
      end

      private

      def find_garden
        @garden = Garden.find(params[:garden_id])
      end

      def already_liked?
        Favorite.where(user_id: current_user.id, garden_id:
        params[:garden_id]).exists?
      end
    end
  end
end
