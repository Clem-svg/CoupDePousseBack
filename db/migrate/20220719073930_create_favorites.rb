# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.belongs_to :garden, index: true
      t.timestamps
    end
  end
end
