Rails.application.routes.draw do
  resources :games, only: [:new, :create]

  devise_for :users
  root to: 'static#home'
end
