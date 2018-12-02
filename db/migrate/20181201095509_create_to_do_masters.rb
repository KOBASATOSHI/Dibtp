class CreateToDoMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :to_do_masters do |t|
      t.string :name
      t.string :detail
      t.integer :order, limit: 2
      t.integer :parent_order, limit: 2
      t.integer :to_do_type, limit: 1
      t.integer :deadline_days, limit: 2
      t.references :to_do_group
      t.timestamps
    end
  end
end
