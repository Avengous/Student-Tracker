StudentTracker::Application.routes.draw do
  resources :users
  root 'pages#home'
end
