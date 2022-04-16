Rails.application.routes.draw do
  root 'users#index'
  resources :users
  get "users/:user_id/newpost" => "users#newpost",:as => :forums
  post "users/:user_id/newpost" => "users#createpost", :as => :create_forum
  get "users/:user_id/posts/:post_id/newcomment" => "users#newcomment",:as => :forumssecond
  post "users/:user_id/posts/:post_id/createcomment" => "users#createcomment", :as => :create_forumsecond
  # get "/users/:user_id/posts(.:format)", to: "posts#index"
  # get "/users/:user_id/posts/:id(.:format)", to: "posts#show"
  # get "/users(.:format)", to: "users#index"
  # get "/users/:id(.:format)", to: "users#show"
  resources :users, only: [:newpost,:index, :show] do
    resources :posts, only: [:newpost,:index, :show]
end
end


