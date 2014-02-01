class RemoveTaskColumn < ActiveRecord::Migration
  def up
    remove_column :tasks, :project_id
  end

  def down
  end
end
