Rails.application.routes.draw do
  resources :posts
  resources :comments, only: %w( create edit update destroy )

  scope module: :authentication do
    get "/users/new", to: "users#new", as: :register
    post "/users/new", to: "users#create"
    get "/login", to: "sessions#new", as: :login
    post "/login", to: "sessions#create"
  end

  root "posts#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
