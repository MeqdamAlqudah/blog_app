class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @posts = Users.where(id: user_id)[0].get_all_posts(user_id)
    @user = Users.where(id: user_id)[0]
    @users = Users.all
    @link = "http://127.0.0.1:3000/users/#{user_id}/posts"
    @comments = Comment.where(author_id: user_id)
    puts params
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @post = Posts.where(id: post_id)[0]
    @user = Users.where(id: user_id)[0]
    @comments = Comment.where(author_id: post_id)
    puts params
  end

  def create
    pauthor_id = params[:author_id]
    ptitle = params[:title]
    ptext = params[:text]
    Posts.create(author_id: pauthor_id, title: ptitle, text: ptext)
  end
end
