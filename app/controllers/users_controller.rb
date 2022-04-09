class UsersController < ApplicationController
  def index
    @users = Users.all
    puts params
  end
  def show
    id = params[:id]
    @user = Users.where(id:id)[0]
    @posts = Users.where(id:id)[0].most_recent_n(id)
    puts params
  end
  def create
    uname = params[:name]
    uphoto = params[:photo]
    ubio = params[:bio]
    Users.create(name: uname, photo:uphoto, bio: ubio)
    redirect_to "/users/index"
  end
end
