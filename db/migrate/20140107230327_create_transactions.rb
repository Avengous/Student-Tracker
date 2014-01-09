class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :student
      t.belongs_to :laptop
      t.belongs_to :user
      t.datetime :time_in
      t.datetime :time_out
      
      t.timestamps
    end
  end
end
