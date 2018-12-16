class AddActiveToUserToDoGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :user_to_do_groups, :active, :boolean, default: false, null: false
  end
end
