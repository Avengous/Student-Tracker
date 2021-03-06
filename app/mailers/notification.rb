class Notification < ActionMailer::Base
  before_action :setup_client
  
  def test_message
    @client.deliver(
    from: 'Test Notification <g.schuoler0114@yearup.org>',
    to: 'Test Recipient <g.schuoler0114@yearup.org>',
    subject: 'Test Email',
    text_body: 'This is a test email.'
    )
  end
  
  def assign_ticket_message(ticket)
    name = "#{ticket.assigned_user.firstname} #{ticket.assigned_user.lastname}"
    email = ticket.assigned_user.email
    title = nil
    ticket.student_id.nil? ? title = ticket.title : title = "#{ticket.student.full_name} - #{ticket.title}"
    
    @client.deliver(
    from: "YUPS Notifications <g.schuoler0114@yearup.org>",
    to: "#{name} <#{email}>",
    subject: "You've been assigned a ticket",
    html_body: "<b>Title: </b>#{title}<br /><b>Status: </b>#{ticket.status}<br /><br /><b>Description: </b><br />#{ticket.description}<br />"
    )
  end
  
  def ticket_comment_message(comment)
    ticket = comment.ticket
    user = comment.user
    
    name = "#{ticket.assigned_user.firstname} #{ticket.assigned_user.lastname}"
    email = ticket.assigned_user.email
    title = nil
    ticket.student_id.nil? ? title = ticket.title : title = "#{ticket.student.full_name} - #{ticket.title}"
    
    @client.deliver(
    from: "YUPS Notifications <g.schuoler0114@yearup.org>",
    to: "#{name} <#{email}>",
    subject: "#{user.firstname} has commented on #{title}",
    html_body: "#{comment.user.firstname} #{comment.user.lastname} -<br />#{comment.response.gsub("\n","<br>\n").html_safe}"
    )
  end
  
  private
  
  def setup_client
    @api_key = 'bf27f727-7607-4eb5-af86-425173a71414'
    @client = Postmark::ApiClient.new(@api_key)
  end
  
end
