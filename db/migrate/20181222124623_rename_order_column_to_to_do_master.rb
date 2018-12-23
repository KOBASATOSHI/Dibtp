class RenameOrderColumnToToDoMaster < ActiveRecord::Migration[5.1]
  def change
    rename_column :to_do_masters, :order, :order_number
  end
end
