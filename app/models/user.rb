class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation
  
  email_format = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
  
  
  validates :firstname, :presence => true,
                        :length => { :maximum => 20}
                        
  validates :lastname,  :presence => true,
                        :length => { :maximum => 20}
                       
  validates :email, :presence => true,
                    :length => { :maximum => 50},
                    :with => email_format,
                    :uniqueness => { :case_sensitive => false }
                    
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..20 }
end
