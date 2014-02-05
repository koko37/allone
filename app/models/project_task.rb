class ProjectTask < ActiveRecord::Base
  belongs_to :project
  belongs_to :task
  
  before_save :clone_task_attributes
    
  attr_accessible :description, :labor_cost, :material_cost, :unit_retail, :quantity, :period, :task_id, :project_id

  def clone_task_attributes
    if self.task_id != nil && self.description == nil then
      self.description = self.task.description
      self.labor_cost = self.task.labor_cost
      self.material_cost = self.task.material_cost
      self.unit_retail = self.task.unit_retail
      
      self.quantity = 1
      self.period = 0
    end
  end
end
