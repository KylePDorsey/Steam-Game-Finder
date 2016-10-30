Rails.application.routes.draw do
	root to: "games#index"

	resources :users
	resources :games
	resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
