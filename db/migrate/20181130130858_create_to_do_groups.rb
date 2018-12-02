class CreateToDoGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :to_do_groups do |t|
      t.string :name
      t.string :detail
      t.boolean :deleted, default: false, null: false
      t.date :deleted_at
      t.timestamps
    end
  end
end
