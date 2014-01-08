class Transaction < ActiveRecord::Base
  attr_accessible :student_id, :laptop_id, :user_id, :timeout, :timein
  
  belongs_to :student
  belongs_to :laptop
  belongs_to :user
  
  validates :student_id, :presence => true
  validates :laptop_id, :presence => true
  validates :user_id, :presence => true
  
  before_create :set_time_out
  
  private
  
    def set_time_out
      self.time_out = Time.now.utc
    end
    
end
