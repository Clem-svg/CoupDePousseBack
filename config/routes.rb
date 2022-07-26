# frozen_string_literal: true

Rails.application.routes.draw do
  root 'gardens#index'
  use_doorkeeper
  devise_for :users
  resources :users
  resources :gardens do
    resources :comments
    resources :favorites
    resources :appointments
  end

  resources :users do
    resources :chat_rooms, except: [:edit]
  end
  mount ActionCable.server => '/cable'

  draw :api
end
