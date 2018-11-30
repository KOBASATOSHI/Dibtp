class AddDeletedToTaskMastarUserTaskMaster < ActiveRecord::Migration[5.1]
  def change
    add_column :task_masters, :deleted, :boolean, default: false
    add_column :task_masters, :deleted_at, :date
    add_column :user_task_masters, :deleted, :boolean, default: false
    add_column :user_task_masters, :deleted_at, :date
  end
end
