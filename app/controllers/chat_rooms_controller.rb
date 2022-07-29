# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: [:show, :edit, :update, :destroy]

  def index
    @chat_rooms = ChatRoom.where(sender_id: current_user.id).or(ChatRoom.where(receiver_id: current_user.id))
  end

  def new
    @chat_room = ChatRoom.new
    @user = User.find(params[:user_id])
  end

  def create
    @sender = current_user
    @receiver = User.find(params[:user_id])
    @chat_room = ChatRoom.new(chat_room_params)
    @chat_room.sender = @sender
    @chat_room.receiver = @receiver

    if @chat_room.save
      flash[:success] = 'Conversation créée!'
      redirect_to user_chat_rooms_path(@sender.id)
    else
      render 'new'
    end
  end

  def show   
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id])
    @chat_room.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "La conversation est supprimée" }
      format.js {}
    end
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def chat_room_params
    params.require(:chat_room).permit(:title, :sender_id, :receiver_id)
  end
end