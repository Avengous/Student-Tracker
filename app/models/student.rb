class Student < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email
  
  has_many :transactions
  
  before_save { self.email = email.downcase }
  
  validates :firstname, :presence => true,
                        :length => { :maximum => 20}
                        
  validates :lastname,  :presence => true,
                        :length => { :maximum => 20}
  
  VALID_EMAIL_REGEX = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX, multiline: true },
                    uniqueness: { case_sensitive: false }
                    
  def full_name
    "#{firstname} #{lastname}"
  end                    
end
