Rails.application.routes.draw do
  root to: "static_pages#home"
  
  get "static_pages/home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: %i(index destroy)
  resources :pitches

  namespace :owner do
    resources :pitches
  end
end
