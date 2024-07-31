Rails.application.routes.draw do
  resources :posts
  resources :comments, only: %w( create edit update destroy )

  root "posts#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
