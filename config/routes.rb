StudentTracker::Application.routes.draw do
  resources :users, :path => "/staff"
  resources :sessions, only: [:new, :create, :destroy]
  resources :students
  resources :laptops
    
  root  'pages#home'
  
  match '/add_multiple_users' => 'users#add_multiple_users', via: [:get, :post]
  #match '/add_multiple_users' => 'users#multicreate', via: [:post]
  match '/signin' => 'sessions#new', via: [:get, :post]
  match '/signout' => 'sessions#destroy', via: [:get, :post]
end
