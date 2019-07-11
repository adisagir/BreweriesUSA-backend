Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/login", to: "smsbackend#login"
  post "/signup", to: "users#create"
  post "/reviews", to: "reviews#create"
  get "/profile", to: "users#profile"

  resources :users, only: [:new, :index, :show]
  resources :breweries, only: [:index, :show]
  resources :reviews, only: [:show, :create, :index]
end
