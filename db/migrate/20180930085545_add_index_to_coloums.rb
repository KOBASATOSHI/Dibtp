class AddIndexToColoums < ActiveRecord::Migration[5.1]
  def change
    add_index :task_masters, :id
    add_index :users, :id
  end
end
