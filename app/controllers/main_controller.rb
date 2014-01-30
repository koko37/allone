class MainController < ApplicationController
  def company_home
    @companies = Company.order("updated_at DESC")
  end
  
  def task_home
  end
  
  def project_home
    render :layout => 'projects'
  end
  
  def project_detail
    gon.project= Project.find(params[:id])
  end
  
end
