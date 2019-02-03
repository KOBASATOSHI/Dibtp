class AddAcheiveToUserToDoGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :user_to_do_groups, :achieved, :boolean, null: false, default: false
  end
end
