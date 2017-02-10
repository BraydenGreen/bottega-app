Rails.application.routes.draw do
	resources :teams, only: [:index]
  devise_for :users
  root to: 'static#home'

end
