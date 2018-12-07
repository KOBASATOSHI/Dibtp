class CreateUserToDoGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_to_do_groups do |t|
      t.references :to_do_group
      t.references :user
      t.timestamps
    end
  end
end
