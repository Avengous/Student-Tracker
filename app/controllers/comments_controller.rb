class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      Notification.ticket_comment_message(@comment)
      redirect_to ticket_path(@comment.ticket.id)
    else
      redirect_to ticket_path(@comment.ticket.id)
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    ticket = comment.ticket.id
    comment.destroy
    redirect_to ticket_path(ticket)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:response, :created_at, :user_id, :ticket_id)
  end
end
