class TicketsController < ApplicationController
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
  end
  
  def edit
    @ticket = Ticket.find(params[:id])
    @title = "Editing Ticket"
  end
  
  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(ticket_params)
      redirect_to tickets_path
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
    params.require(:ticket).permit(:assigned_user_id, :created_user_id, :student_id, :title, :description, :status)
  end

end
