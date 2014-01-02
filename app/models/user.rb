class User < ActiveRecord::Base
  attr_accessor   :password, :salt
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation

  email_format = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
  
  before_validation :new_account
  
  validates :firstname, :presence => true,
                        :length => { :maximum => 20}
                        
  validates :lastname,  :presence => true,
                        :length => { :maximum => 20}
                       
  validates_format_of :email, :presence => true,
                    :length => { :maximum => 50},
                    :multiline => true,
                    :with => email_format,
                    :uniqueness => { :case_sensitive => false }
                    
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..20 }

  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      return nil if user.nil?
      return user if user.has_password?(submitted_password)
    end
  end
  
  private 
  
    def new_account
      self.password = first_time_password if new_record?
    end
  
    def encrypt_password
      self.salt = create_salt if new_record?
      self.encrypted_password = encrypt(password)  
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def create_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def first_time_password
      self.password = "yearup"
      self.password_confirmation = "yearup"
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
end
