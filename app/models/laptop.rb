class Laptop < ActiveRecord::Base
  attr_accessible :itemname, :scancode, :available
  
  has_many :transactions, dependent: :destroy
  
  after_initialize :set_defaults, if: :new_record?
  
  validates :itemname, :presence => true,
                        :length => { :maximum => 20},
                        :uniqueness => true
                        
  validates :scancode,  :presence => true,
                        :length => { :maximum => 20},
                        :uniqueness => true
                        
  private
  
  def set_defaults
    self.available = true
  end
end
