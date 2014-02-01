class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_tasks

  attr_accessible :description, :work_order_number, :project_tasks_attributes
  
  accepts_nested_attributes_for :project_tasks
end
