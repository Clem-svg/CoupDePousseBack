# frozen_string_literal: true

class AddMessageInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :body, :string
    add_reference :messages, :user, index: true
    add_reference :messages, :chat_room, index: true
  end
end
