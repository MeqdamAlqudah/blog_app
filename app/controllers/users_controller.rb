class UsersController < ApplicationController
  def newpost
    @user = Users.new
    @user_id = params[:user_id]
    @post = Posts.new(author_id: params[:user_id])
  end

  def newcomment
    @user_id = params[:user_id]
    @post_id = params[:post_id]
    @comment = Comment.new(author_id: params[:user_id])
  end

  def index
    @users = Users.all
    puts params
  end

  def show
    user_id = params[:id]
    @user = Users.where(id: user_id)[0]
    @posts = Users.where(id: user_id)[0].most_recent_n(user_id)
    @link = "http://127.0.0.1:3000/users/#{user_id}/posts"
    puts params
  end

  def createpost
    user_id = params[:user_id]
    data = params[:posts]
    @post = Posts.new(user_id:, title: data[:title], text: data[:text], comments_counter: 0, likes_counter: 0)
    redirect_to "/users/#{user_id}/newpost" if @post.save
  end

  def createcomment
    post_id = params[:post_id]
    user_id = params[:user_id]
    data = params[:comment]
    @comment = Comment.new(author_id: user_id, text: data[:text], post_id:)
    redirect_to "/users/#{user_id}/posts/#{post_id}/newcomment" if @comment.save
  end
end
