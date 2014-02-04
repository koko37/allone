class AddPeriodIntoProject < ActiveRecord::Migration
  def up
    add_column :project_tasks, :period, :integer
  end

  def down
  end
end
