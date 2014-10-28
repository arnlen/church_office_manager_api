Rails.application.routes.draw do

	scope defaults: { format: 'json' } do

	  resources :members, only: [:index, :show, :update]
	  resources :tasks, only: [:index, :show, :update]
	  resources :services, only: [:index, :show, :update]
	  resources :offices, only: [:show, :options]
	  resources :memberships, only: [:create, :destroy]

	end

end
