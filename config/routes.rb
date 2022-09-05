# frozen_string_literal: true

Rails.application.routes.draw do
  root 'gardens#index'
  get '/infos', to: 'pages#home'
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
  resources :messages, except: %i[index show edit]

  mount ActionCable.server => '/cable'

  draw :api
end
