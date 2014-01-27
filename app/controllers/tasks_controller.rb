class TasksController < ApplicationController
  respond_to :json

  def index
    respond_with Task.order("updated_at ASC")
  end
  
  def create
    respond_with Task.create(params[:task])
  end
  
  def update
    respond_with Task.update(params[:id], params[:task])
  end
  
  def destroy
    respond_with Task.destroy(params[:id])
  end
end
