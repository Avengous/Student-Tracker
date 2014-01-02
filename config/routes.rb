StudentTracker::Application.routes.draw do
  get "sessions/new"
  resources :users
  root 'pages#home'
end
