Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get "users/:user_id/newpost" => "users#newpost",:as => :forums
  post "users/:user_id/createpost" => "users#createpost", :as => :create_forum
  get "users/:user_id/posts/:post_id/newcomment" => "users#newcomment",:as => :forumssecond
  post "users/:user_id/posts/:post_id/createcomment" => "users#createcomment", :as => :create_forumsecond

  resources :users, only: [:newpost,:index, :show] do
    resources :posts, only: [:newpost,:index, :show]
end

namespace :api, defaults: { format: :json } do
  namespace :v1 do
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
    end
  end
end

delete "/users/:user_id/posts/:id/delete" => "posts#destroy", as: "posts_delete"
get "/users/:user_id/posts/:id/delete" => "posts#destroy"
end
