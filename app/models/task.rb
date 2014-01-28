class Task < ActiveRecord::Base
  belongs_to :project
  
  attr_accessible :description, :labor_cost, :material_cost, :unit_retail
end
