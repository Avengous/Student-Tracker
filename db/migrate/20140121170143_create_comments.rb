class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :ticket
      t.belongs_to :user
      t.string :response
      
      t.timestamps
    end
  end
end
