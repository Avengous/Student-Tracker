StudentTracker::Application.routes.draw do
  resources :users, :path => "/staff"
  resources :sessions, only: [:new, :create, :destroy]
  resources :students
  resources :laptops
  resources :transactions, :path => "loaner"
  resources :tickets
  resources :comments
    
  root  'pages#home'
  
  match '/resolved_tickets' => 'tickets#get_resolved', via: [:get]  
  match '/checkin' => 'transactions#checkin', via: [:get, :post]
  
  match '/add_multiple_users' => 'users#add_multiple_users', via: [:get, :post, :put]
  match '/add_multiple_students' => 'students#add_multiple_students', via: [:get, :post]
  match '/add_multiple_laptops' => 'laptops#add_multiple_laptops', via: [:get, :post, :put]
  
  match '/test_email' => 'users#test_email', via: [:get, :post]
  
  match '/signin' => 'sessions#new', via: [:get, :post]
  match '/signout' => 'sessions#destroy', via: [:get, :post]
  
  match '/turnin/:id' => 'transactions#turn_in', via: [:get, :post, :put]
  
  get 'feedback' => 'pages#feedback'
  
  get 'database' => 'pages#database'
  
  resources :pages do
    put :delete_all_students, on: :collection
    put :delete_all_laptops, on: :collection
    put :delete_all_tickets, on: :collection
  end
  
end
