# frozen_string_literal: true

class ChatRoom < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :messages, dependent: :destroy
  # after_create :new_conversation_email

  # # emails methods

  # def new_conversation_email
  #   ConversationMailer.new_chat_room(self).deliver_now
  # end

  def pen_pal(user)
    if user.id == sender_id
      receiver.username
    else
      sender.username
    end
  end
end
