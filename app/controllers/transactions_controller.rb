class TransactionsController < ApplicationController
  def index
    @title = "History"
    @transaction = Transaction.all
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
      redirect_to new_transaction_path
    else
      render 'new'
    end
  end
  
  def update
    if @transaction.update_attributes(trans_params)
      redirect_to @transaction
    else
      render 'edit'
    end
  end
  
  private
  
  def trans_params
    params.require(:transaction).permit(:student_id, :laptop_id, :user_id, :time_out, :time_in)
  end
end
