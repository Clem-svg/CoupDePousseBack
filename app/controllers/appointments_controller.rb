class AppointmentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :destroy]

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
      redirect_to user_path(current_user.id)
      flash[:success] = "Le rendez-vous est pris !"
    else
    render :new
    end

  end

  def edit
    @garden = Garden.find(params[:garden_id])
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(app_params)
      flash[:notice] = "Rendez-vous modifié !"
      redirect_to garden_appointment_path(@appointment.garden.id, @appointment.id)

    else
      flash.now[:alert] = "Impossible de modifier le rendez-vous :"
      render :edit
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to user_path(current_user.id)
    flash[:notice] = "Rendez-vous supprimé !"

  end

  private

  def app_params
    app_params = params.require(:appointment).permit(:start_date, :end_date, :message_contact, :garden_id, :host_id, :guest_id)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez vous connecter pour prendre un rendez-vous"
      redirect_to new_user_session_path
    end
  end


end
