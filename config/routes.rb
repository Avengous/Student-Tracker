StudentTracker::Application.routes.draw do
  get "users/new"
  get "users/show/:id" => 'users#show'
  get "users" => 'users#index'
  root 'pages#home'
end
