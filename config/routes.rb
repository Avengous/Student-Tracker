StudentTracker::Application.routes.draw do
  get "users/new"
  get "users" => 'users#index'
  root 'pages#home'
end
