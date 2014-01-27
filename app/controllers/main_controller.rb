class MainController < ApplicationController
  def company_home
    @companies = Company.order("updated_at DESC")
  end
  
  def task_home
  
  end
  
end
