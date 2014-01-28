class AddProjectId < ActiveRecord::Migration
  def up
    add_column :tasks, :project_id, :integer
  end

  def down
  end
end
