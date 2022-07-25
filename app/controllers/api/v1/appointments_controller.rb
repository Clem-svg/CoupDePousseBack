# frozen_string_literal: true

module Api
  module V1
    class AppointmentsController < ApiController
      before_action :set_appointment, only: %i[show edit update destroy]
      before_action :doorkeeper_authorize!, only: %i[show edit update destroy]

      def new
        @garden = Garden.find(params[:garden_id])
        @appointment = Appointment.new
      end

      def index
        @appointments = current_user.appointments
      end

      def show
        @appointment = Appointment.find(params[:id])
        @garden = @appointment.garden
      end

      def create
        @garden = Garden.find(params[:garden_id])
        @appointment = Appointment.new(app_params)
        @appointment.garden = @garden
        @appointment.host = @garden.user
        @appointment.guest = current_user
        if @appointment.save
          render json: @appointment
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
      end

      def edit
        render json: @appointment
      end

      def update
        @appointment = Appointment.find(params[:id])
        if @appointment.update(app_params)
          render json: @appointment
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Appointment.find(params[:id]).destroy
        render json: {error: "Appointment successfully deleted"}
      end

      private

      def set_appointment
        @appointment = Appointment.find_by_id(params[:id])
        render json: {error: "Appointment not found"}, status: :not_found if @appointment.nil?
      end

      def app_params
        app_params = params.require(:appointment).permit(:start_date, :end_date, :message_contact)
      end
    end
  end
end
