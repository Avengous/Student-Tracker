class Notification < ActionMailer::Base
  before_action :setup_client
  
  def test_message
    @client.deliver(
    from: 'g.schuoler0114@yearup.org',
    to: 'g.schuoler0114@yearup.org',
    subject: 'Test Email',
    text_body: 'This is a test email.'
    )
  end
  
  private
  
  def setup_client
    @api_key = 'bf27f727-7607-4eb5-af86-425173a71414'
    @client = Postmark::ApiClient.new(@api_key)
  end
  
end
