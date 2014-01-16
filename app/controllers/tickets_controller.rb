class TicketsController < ApplicationController
  before_action :assigned_value, only: [:edit, :update]
    
  def index
    @title = 'Tickets'
    @ticket = Ticket.all
  end
  
  def show
    @ticket = Ticket.find(params[:id])
  end
  
  def new
    @ticket = Ticket.new
    @title = 'New Ticket'
  end
  
  def create
    @ticket = Ticket.new(ticket_params)
    #@user = get_current_user
   
    if @ticket.save
      @ticket.assigned_user_id.nil? ? nil : Notification.assign_ticket_message(@ticket)
      redirect_to tickets_path
    else
      render 'new'
    end
  end
  
  def edit
    @ticket = Ticket.find(params[:id])
    @title = "Editing Ticket"
  end
  
  def update
    @ticket = Ticket.find(params[:id])
    
    if @ticket.update_attributes(ticket_params)
      redirect_to tickets_path
      @ticket.assigned_user_id != @previous_value ? Notification.assign_ticket_message(@ticket) : nil 
    else
      render 'edit'
    end  
  end

  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
    redirect_to tickets_url
  end
  
  private
  
  def ticket_params
    params.require(:ticket).permit(:user_id, :created_user, :assigned_user, :created_user_id, :assigned_user_id, :student_id, :title, :description, :status)
  end
  
  def assigned_value
    @ticket = Ticket.find(params[:id])
    @previous_value = @ticket.assigned_user_id
    #return @previous_value
  end

end