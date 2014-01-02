class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid Email/Password"
      render new_session_path
    else
      
    end
  end
  
  def destroy
    
  end
end
