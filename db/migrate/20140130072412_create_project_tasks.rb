class CreateProjectTasks < ActiveRecord::Migration
  def change
    create_table :project_tasks do |t|
    
      t.string :description
      t.float :labor_cost
      t.float :material_cost
      t.float :unit_retail
    
      t.integer :project_id
      t.integer :task_id
      t.timestamps
    end
  end
end
