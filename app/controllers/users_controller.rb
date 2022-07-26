# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    # showing user's favorites
    @user_favorites = current_user.favorites
    @favorited_gardens = []
    @user_favorites.each do |fav|
      @favorited_gardens << fav.garden
    end

    # selecting garden created by user
    @gardens = @user.gardens

    # finding the user's appointments
    @appointments = Appointment.where(guest_id: current_user.id).or(Appointment.where(host_id: current_user.id))

    # selecting chatrooms created by user or sent to user
    #   @chat_rooms = ChatRoom.where(sender_id: current_user.id).or(ChatRoom.where(receiver_id: current_user.id))
  end

  def create
    flash[:notice] = 'Registration needed'
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = 'Profil édité !'
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Impossible d'éditer le profil :"
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :avatar, :description, :tools)
    end
end
