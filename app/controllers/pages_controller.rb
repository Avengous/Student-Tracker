class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def feedback
    @title = 'Feedback'
  end
end
