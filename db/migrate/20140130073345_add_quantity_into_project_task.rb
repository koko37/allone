class AddQuantityIntoProjectTask < ActiveRecord::Migration
  def up
    add_column :project_tasks, :quantity, :integer
  end

  def down
  end
end
