class UsersController < ApplicationController
  
  def index
    @title = "Users"
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @title = "#{@user.firstname} #{@user.lastname}"
  end
  
  def new
    @title = "New User"
  end
  

end
