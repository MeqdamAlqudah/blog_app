Rails.application.routes.draw do
  root 'users#index'
  resources :users
  get "users/:user_id/newpost" => "users#newpost",:as => :forums
  post "users/:user_id/newpost" => "users#createpost", :as => :create_forum
  get "users/:user_id/posts/:post_id/newcomment" => "users#newcomment",:as => :forumssecond
  post "users/:user_id/posts/:post_id/createcomment" => "users#createcomment", :as => :create_forumsecond

  resources :users, only: [:newpost,:index, :show] do
    resources :posts, only: [:newpost,:index, :show]
end
end


