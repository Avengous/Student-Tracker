class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :assigned_user_id
      t.integer :created_user_id
      t.belongs_to :student
      t.string :title
      t.text :description
      t.string :status
      
      t.timestamps
    end
  end
end
