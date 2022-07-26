# frozen_string_literal: true

class CreateChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.belongs_to :sender, index: true
      t.belongs_to :receiver, index: true

      t.timestamps
    end
  end
end
