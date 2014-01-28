class Project < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  has_may :tasks
  
end
