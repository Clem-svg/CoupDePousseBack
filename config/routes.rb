Rails.application.routes.draw do
  root 'pages#home'
  use_doorkeeper
  devise_for :users
  resources :users


  draw :api
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
