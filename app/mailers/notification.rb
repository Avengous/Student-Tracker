class Notification < ActionMailer::Base
  
  def test_message
    @user = User.find_by_id(1)
    
    mail(
      :subject => 'YUPSMist Test Email',
      :to      => 'g.schuoler0114@yearup.org',
      :from    => 'xxstryderxx@hotmail.com',
      :tag     => 'test'
    )
  end
  
end
