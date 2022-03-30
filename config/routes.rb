Rails.application.routes.draw do
  root 'users#index'
  get "/users/:user_id/posts(.:format)", to: "posts#index"
  get "/users/:user_id/posts/:id(.:format)", to: "posts#show"
  get "/users(.:format)", to: "users#index"
  get "/users/:id(.:format)", to: "users#show"
end
