StudentTracker::Application.routes.draw do
  resources :users
  resources :sessions,      only: [:new, :create, :destroy]
    
  root  'pages#home'
  
  match '/signin' => 'sessions#new', via: [:get, :post]
  match '/signout' => 'sessions#destroy', via: [:get, :post]
end
