class TaskMastersController < ApplicationController
  
  def index
    @task_master = TaskMaster.new
    @task_masters = TaskMaster.all
  end
  
  def create
    @task_master = TaskMaster.new(task_master_params)
    if @task_master.save
      redirect_to task_masters_path
    else
      @task_masters = TaskMaster.all
      render 'index'
    end
  end
  
  def edit
    @task_master = TaskMaster.find(params[:id])
  end
  
  def update
    @task_master = TaskMaster.find(params[:id])
    if @task_master.update_attributes(task_master_params)
      redirect_to task_masters_path
    else
      render 'edit'
    end
  end

  private
  def task_master_params
    params.require(:task_master).permit(:category, :name, :detail)
  end
end
