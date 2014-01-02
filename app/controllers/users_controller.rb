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
    #Obscure passwords in HTML using f.password_field
    @user = User.new
    @title = "New User"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, :flash => { :success => "User Added" }
    else
      @title = "New User"   
      render 'new'
    end
  end

end
