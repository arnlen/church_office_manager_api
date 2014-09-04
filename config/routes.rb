Rails.application.routes.draw do

  resources :members, only: [ :index, :show, :create, :update, :destroy ]

  resources :offices, only: [ :index, :show, :create, :update, :destroy ]
  get 'office/next/:amount', to: 'offices#next_office', as: 'next_office'

  resources :services, only: [ :index, :show, :create, :update, :destroy ]

  resources :service_templates, only: [ :index, :show, :create, :update, :destroy ]

  resources :tasks, only: [ :show, :create, :update, :destroy ]

  resources :task_templates, only: [ :index, :show, :create, :update, :destroy ]

end
