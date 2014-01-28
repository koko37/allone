class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.text :description
      t.string :work_order_number
      
      t.timestamps
    end
  end
end
