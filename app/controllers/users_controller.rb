class UsersController < ApplicationController
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :admin_user,     only: [:index, :new, :create, :destroy, :add_multiple_users, :multicreate]
  
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
    @user = User.find(params[:id])
    @title = "Settings"
  end

  def update
    #@user.attributes = params[:user]
    #@user.save(validate:false)  
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
  
  def add_multiple_users
    @title = "Add Users"
    @entries = params[:entries]
    multicreate
  end
  
  def multicreate
    if @entries.nil? then
    else
      @entries.each_line do |entry|
        entry = entry.split(" ")    
        @user = User.new(firstname: entry[0], lastname: entry[1], email: entry[2].downcase, password: "yearup", password_confirmation: "yearup")
        @user.save
      end
      redirect_to users_url
    end
  end
  
  def test_email  
    Notification.test_message
    redirect_to root_path
  end
  
  private
  
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :admin)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || current_user.admin?
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def get_current_user
      @current_user = current_user
    end

end
