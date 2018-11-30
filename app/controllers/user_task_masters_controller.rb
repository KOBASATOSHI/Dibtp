class UserTaskMastersController < ApplicationController
  
  def create
    @task_master = TaskMaster.find(params[:task_master_id])
    @user_task_master = @task_master.user_task_masters.new(user_id: current_user.id)
    if !UserTaskMaster.where("user_id = ? and task_master_id = ?", current_user.id , @task_master.id).exists?
      @user_task_master.save
      flash[:success] = "新しくタスクが登録されました"
    else
      flash[:danger] = "このタスクはすでに登録済みです"
    end
    redirect_to main_path
  end
  
  def destroy
    @user_task_master = UserTaskMaster.find(params[:id])
    @user_task_master.update_attributes( deleted: true, deleted_at: Date.today )
    redirect_to main_path
  end
end