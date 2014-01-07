class Transaction < ActiveRecord::Base
  belongs_to :student
  belongs_to :laptop
  belongs_to :user
end
