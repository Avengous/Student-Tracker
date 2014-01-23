class PagesController < ApplicationController
  before_action :admin_user,     only: [:index]
  
  def home
    @title = "Home"
    redirect_to user_path(current_user.id)
  end
  
  def feedback
    @title = 'Feedback'
  end
  
  def database
    @title = 'Database'
  end
  
  def delete_all_students
    Laptop.update_all( "available = 'true'" )
    Student.destroy_all
    redirect_to database_path
  end
  
  def delete_all_laptops
    Laptop.destroy_all
    redirect_to database_path
  end
  
  def delete_all_tickets
    Ticket.destroy_all
    redirect_to database_path
  end
  
  private
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
