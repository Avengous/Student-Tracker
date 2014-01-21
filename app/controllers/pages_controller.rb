class PagesController < ApplicationController
  def home
    @title = "Home"
    redirect_to user_path(current_user.id)
  end
  
  def feedback
    @title = 'Feedback'
  end
end
