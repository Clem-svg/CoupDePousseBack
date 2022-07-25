# frozen_string_literal: true

module Api
  module V1
    class GardensController < ApiController
      before_action :set_garden, only: %i[show edit update destroy]
      before_action :doorkeeper_authorize!, only: %i[show edit update destroy]

      # GET /gardens or /gardens.json
      def index
        @gardens = Garden.all
        render json: @gardens
      end

      # GET /gardens/1 or /gardens/1.json
      def show
        render json: @garden
      end

      # GET /gardens/new
      def new
        render json: @garden = Garden.new
      end

      # GET /gardens/1/edit
      def edit
        render json: @garden
      end

      # POST /gardens or /gardens.json
      def create
        @garden = Garden.new(garden_params.merge(user_id: current_user.id))

        if @garden.save
          render json: @garden
        # format.json { render :show, status: :created, location: @garden }
        else
          format.json { render json: @garden.errors, status: :unprocessable_entity }
        end
      end

      # PATCH/PUT /gardens/1 or /gardens/1.json
      def update
        if @garden.update(garden_params)
          render json: @garden
        else
          render json: @garden.errors, status: :unprocessable_entity
        end
      end

      # DELETE /gardens/1 or /gardens/1.json
      def destroy
        if @garden.user_id == current_user.id
          @garden.destroy
          render json: {error: "Garden successfully deleted"}, status: :ok
        else
          render json: {error: "Cannot delete garden not created by this user"}, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_garden
        @garden = Garden.find_by_id(params[:id])
        render json: {error: "Garden not found"}, status: :not_found if @garden.nil?
      end

      # Only allow a list of trusted parameters through.
      def garden_params
        params.require(:garden).permit(:title, :description, :orientation, :floor_type, :parking, :tools_available,
                                       :surface, :street_number, :street_name, :zip_code, :city, :country)
      end
    end
  end
end
