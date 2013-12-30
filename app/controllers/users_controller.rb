class UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def new
  end
  
  def show
    @user = User.find(params[:id])
  end
end
