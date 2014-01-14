class Ticket < ActiveRecord::Base
  attr_accessible :assigned_user_id, :created_user_id, :student_id, :title, :description, :status
  
  belongs_to :user
  belongs_to :student
  
  before_create :set_creator
  
  validates :title, :presence => true,
                    :length => { :maximum => 64 }
  
  validates :description, :presence => true,
                          :length => { :maximum => 5000 }
  
  private
  
    def set_creator
      self.created_user_id = current_user.id
    end
    
end
