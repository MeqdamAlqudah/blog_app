class UsersController < ApplicationController
  def new
    @user = Users.new
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

  def create
    @new_user_form = Users.new(params(:user))
    redirect_to new_user_path if @new_user_form.save
  end
end
