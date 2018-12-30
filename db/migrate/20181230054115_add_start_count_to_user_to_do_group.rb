class AddStartCountToUserToDoGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :user_to_do_groups, :start_count, :integer, limit: 2
    add_column :to_dos, :start_count, :integer, limit: 2
  end
end
