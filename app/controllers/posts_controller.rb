class PostsController < ApplicationController
  def new
    @post = Post.new(author_id: params[:user_id])
  end

  def index
    user_id = params[:user_id]
    @user = User.where(id: user_id)[0]
    @posts = @user.posts.includes(:comments)
    @users = User.all
    @link = "http://127.0.0.1:3000/users/#{user_id}/posts"
    puts params
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @post = Post.where(id: post_id)[0]
    @user = User.where(id: user_id)[0]
    @comments = Post.where(id: post_id)[0].comment
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
    Post.create(user_id: pauthor_id, author_id: pauthor_id, title: ptitle, text: ptext)
  end
end
