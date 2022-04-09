class UsersController < ApplicationController
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
    uname = params[:name]
    uphoto = params[:photo]
    ubio = params[:bio]
    Users.create(name: uname, photo: uphoto, bio: ubio)
    redirect_to '/users/index'
  end
end
