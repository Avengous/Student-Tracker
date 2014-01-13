class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :user
      t.belongs_to :user
      t.belongs_to :student
      t.string :title
      t.text :description
      t.string :status
      
      t.timestamps
    end
  end
end
