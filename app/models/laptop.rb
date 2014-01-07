class Laptop < ActiveRecord::Base
  attr_accessible :itemname, :scancode, :available
  
  validates :itemname, :presence => true,
                        :length => { :maximum => 20},
                        :uniqueness => true
                        
  validates :scancode,  :presence => true,
                        :length => { :maximum => 20},
                        :uniqueness => true
end
