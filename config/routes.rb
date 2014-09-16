Rails.application.routes.draw do

	scope defaults: { format: 'json' } do

	  resources :members, only: [ :index, :show, :update ]
	  resources :tasks, only: [ :index, :update ]
	  resources :services, only: [ :index, :show, :update ]
	  resources :offices, only: :show

	 	match 'offices/next/:amount', to: 'offices#next_office', as: 'next_office', via: [ :options, :get ]

	end

end
