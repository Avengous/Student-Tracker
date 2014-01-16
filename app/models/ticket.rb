class Ticket < ActiveRecord::Base
  attr_accessible :user_id, :assigned_user_id, :created_user_id, :student_id, :title, :description, :status, :created_at, :updated_at, :priority
  
  has_many :users
  belongs_to :assigned_user, class_name: 'User', foreign_key: 'assigned_user_id'
  belongs_to :created_user, class_name: 'User', foreign_key: 'created_user_id'
  
  belongs_to :student
  
  validates :title, :presence => true,
                    :length => { :maximum => 64 }
  
  validates :description, :presence => true,
                          :length => { :maximum => 5000 }
  
end
