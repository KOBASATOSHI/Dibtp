class StaticPagesController < ApplicationController
  def main
    @task_masters = TaskMaster.all
    @user_task_masters = current_user.user_task_masters
    @utm_tm_ids = current_user.task_master_ids
  end
end
