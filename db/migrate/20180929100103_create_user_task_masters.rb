class CreateUserTaskMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :user_task_masters do |t|
      t.references :user,  index: true, foreign_key: true
      t.references :task_master,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
