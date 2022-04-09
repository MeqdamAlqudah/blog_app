Rails.application.routes.draw do
  root 'users#index'
  get "users/new", to: "users#new"
  # get "/users/:user_id/posts(.:format)", to: "posts#index"
  # get "/users/:user_id/posts/:id(.:format)", to: "posts#show"
  # get "/users(.:format)", to: "users#index"
  # get "/users/:id(.:format)", to: "users#show"
  resources :users, only: [:index, :show,:new] do
    resources :posts, only: [:index, :show]
end
end


