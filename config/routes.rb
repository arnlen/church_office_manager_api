Rails.application.routes.draw do

	scope defaults: { format: 'json' } do

	  resources :members, only: [ :index ]
	  resources :tasks, only: [ :update ]
	  resources :services, only: [ :show ]

	 	match 'offices/next/:amount', to: 'offices#next_office', as: 'next_office', via: [ :options, :get ]

	end

end
