class RollbackToReceiverAndSender < ActiveRecord::Migration[6.1]
  def change
    remove_column :chat_rooms, :user_id
    add_reference :chat_rooms, :sender, index: true
    add_reference :chat_rooms, :receiver, index: true

  end
end
