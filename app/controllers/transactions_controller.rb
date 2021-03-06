class TransactionsController < ApplicationController
  def index
    @title = "History"
    @transaction = Transaction.paginate(:page => params[:page], :per_page => 20)
  end
  
  def checkin
    @title = "Check-In"
    #Modify to select transactions without an time in.
    @transaction = Transaction.where(time_in: nil)
  end
  
  def turn_in
    transaction = Transaction.find(params[:id])
    transaction.update_attribute(:time_in, Time.now.utc)
    transaction.laptop.update_attribute(:available, true)
    redirect_to checkin_path
  end
  
  def show 
    @transaction = Transaction.find(params[:id])
    @title = "Report"
  end
  
  def new
    @transaction = Transaction.new
    @title = "Check Out"
  end
  
  def create
    @transaction = Transaction.new(trans_params)   
    if @transaction.save
      @transaction.laptop.update_attribute(:available, false)
      redirect_to transactions_path
    else
      render 'new'
    end
  end
  
  def edit
    @transaction = Transaction.find(params[:id])
    @title = "Checkout"
  end
  
  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(trans_params)
      redirect_to transactions_path
    else
      render 'edit'
    end
  end
  
  def destroy
    transaction = Transaction.find(params[:id])
    if transaction.time_in.nil?
      transaction.laptop.update_attribute(:available, true)
      transaction.destroy
    else
      transaction.destroy
    end  
    redirect_to transactions_url
  end
  
  private
  
  def trans_params
    params.require(:transaction).permit(:student_id, :laptop_id, :user_id, :time_out, :time_in)
  end

end
