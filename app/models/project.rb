class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  attr_accessible :description, :work_order_number
end
