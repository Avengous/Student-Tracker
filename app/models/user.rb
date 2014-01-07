class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation
  
  before_validation :new_user_password
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  validates :firstname, :presence => true,
                        :length => { :maximum => 20}
                        
  validates :lastname,  :presence => true,
                        :length => { :maximum => 20}
  
  VALID_EMAIL_REGEX = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX, multiline: true },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password
  validates :password, length: { minimum: 6 }, if: :password_validation_required?

  def password_validation_required?
    self.password_digest.blank? || !self.password.blank?
  end
    
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  
    def new_user_password
      if new_record? && self.password.nil?
        self.password = "yearup"
        self.password_confirmation = "yearup"
      end
    end

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end  
end
