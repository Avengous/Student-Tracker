StudentTracker::Application.routes.draw do
  resources :users, :path => "/staff"
  resources :sessions, only: [:new, :create, :destroy]
  resources :students
  resources :laptops
  resources :transactions, :path => "loaner"
    
  root  'pages#home'
  
  match '/checkin' => 'transactions#checkin', via: [:get, :post]
  match '/add_multiple_users' => 'users#add_multiple_users', via: [:get, :post]
  match '/add_multiple_students' => 'students#add_multiple_students', via: [:get, :post]
  match '/add_multiple_laptops' => 'laptops#add_multiple_laptops', via: [:get, :post]
  match '/signin' => 'sessions#new', via: [:get, :post]
  match '/signout' => 'sessions#destroy', via: [:get, :post]
  
  match '/turnin/:id' => 'transactions#turn_in', via: [:get, :post, :put]
end
