class ProjectTasksController < ApplicationController
  before_filter :get_project
  respond_to :json
  
  def index
    respond_with @project.project_tasks.order("updated_at ASC")
  end
  
  def create
    respond_with @project.project_tasks.create(params[:project_task])
  end
  
  def update
    respond_with @project.project_tasks.update(params[:id], params[:project_task])
  end
  
  def destroy
    respond_with @project.project_tasks.destroy(params[:id])
  end

protected
  def get_project
    @project = Project.find(params[:project_id])
  end
end
