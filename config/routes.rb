Rails.application.routes.draw do
  resources :posts
  post '/posts/:id', to: 'posts#create_comment', as: :new_comment

  scope module: :authentication do
    get '/login', to: 'sessions#new', as: :new_session
    post '/login', to: 'sessions#create'
    delete '/login', to: 'sessions#destroy'
  end

  root 'posts#index'
end
