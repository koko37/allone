class Task < ActiveRecord::Base
  has_many :project_tasks

  attr_accessible :description, :labor_cost, :material_cost, :unit_retail
end
