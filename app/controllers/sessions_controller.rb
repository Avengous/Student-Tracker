class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash[:error] = "Invalid Email/Password"
      render 'new'
    else
      
    end
  end
  
  def destroy
    
  end
end
