Rails.application.routes.draw do
  root 'pages#home'
  use_doorkeeper
  devise_for :users
  resources :gardens do
    resources :comments
    resources :favorites
    resources :appointments
  end
  draw :api
end
