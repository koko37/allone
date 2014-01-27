class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.string :description
      t.float :labor_cost
      t.float :material_cost
      t.float :unit_retail
      
      t.timestamps
    end
  end
end
