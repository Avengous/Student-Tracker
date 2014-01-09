class CreateLaptops < ActiveRecord::Migration
  def change
    create_table :laptops do |t|
      t.string :itemname
      t.string :scancode
      t.boolean :available

      t.timestamps
    end
  end
end
