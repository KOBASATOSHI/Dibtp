class CreateTaskMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :task_masters do |t|
      t.integer :category
      t.string  :name
      t.text  :detail
      t.timestamps
    end
  end
end
