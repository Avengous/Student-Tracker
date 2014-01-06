class UsersController < ApplicationController
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :admin_user,     only: [:index, :new, :create, :destroy]
  
  def index
    @title = "Staff"
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @title = "#{@user.firstname} #{@user.lastname}"
  end
  
  def new
    @user = User.new
    @title = "New Staff Account"
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = current_user
    @title = "Settings"
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end
  
  private
  
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
