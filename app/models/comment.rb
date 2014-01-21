class Comment < ActiveRecord::Base
  attr_accessible :response, :created_at, :user_id, :ticket_id
  
  belongs_to :user
  belongs_to :ticket
  
  validates :response, :presence => true
end
