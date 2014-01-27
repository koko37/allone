class Task < ActiveRecord::Base
  attr_accessible :description, :labor_cost, :material_cost, :unit_retail
end
