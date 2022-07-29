class ChangeSenderAndReceiverToUser < ActiveRecord::Migration[6.1]
    def change
      remove_column :chat_rooms, :sender_id
      remove_column :chat_rooms, :receiver_id
      add_reference :chat_rooms, :user, index: true
    end
  end