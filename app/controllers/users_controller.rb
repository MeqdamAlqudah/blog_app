class UsersController < ApplicationController
  def new
    @user = Users.new
  end

  def newpost
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
    userid = params[:user_id]
    data = params[:posts]
    @post = Posts.new(author_id: userid, user_id: userid, title: data[:title], text: data[:text], comments_counter: 0,
                      likes_counter: 0)
    puts @post.save
    puts @post.user_id
    puts @post.comments_counter
    puts @post.likes_counter
    redirect_to "/users/#{user_id}/newpost" if @post.save
    puts params
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Please enter a valid input'
    redirect_to root_url
  end

  def createcomment
    post_id = params[:post_id]
    user_id = params[:user_id]
    data = params[:comment]
    @comment = Posts.where(id: post_id.to_i)[0].create_comment(data[:text])
    redirect_to "/users/#{user_id}/posts/#{post_id}/newcomment" if @comment.save
    puts params
  end
end
