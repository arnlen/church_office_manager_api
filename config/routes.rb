Rails.application.routes.draw do

  resources :members, only: [ :index ]

  match 'offices/next/:amount', to: 'offices#next_office', as: 'next_office', via: [ :options, :get ]

end
