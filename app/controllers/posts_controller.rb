class PostsController < ApplicationController
  def new
    @post = Posts.new(author_id: params[:user_id])
  end

  def index
    user_id = params[:user_id]
    @posts = Users.where(id: user_id)[0].get_all_posts(user_id)
    @user = Users.where(id: user_id)[0]
    @users = Users.all
    @link = "http://127.0.0.1:3000/users/#{user_id}/posts"
    puts params
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @post = Posts.where(id: post_id)[0]
    @user = Users.where(id: user_id)[0]
    @comments = Posts.where(id: post_id)[0].comment
    puts params
  end

  def destroy
    session.delete(:post_id)
    flash[:notice] = 'Please enter a valid input'
    redirect_to root_url
  end

  def create
    pauthor_id = params[:author_id]
    ptitle = params[:title]
    ptext = params[:text]
    Posts.create(user_id: pauthor_id, author_id: pauthor_id, title: ptitle, text: ptext)
  end
end
