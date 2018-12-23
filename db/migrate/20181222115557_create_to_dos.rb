class CreateToDos < ActiveRecord::Migration[5.1]
  def change
    create_table :to_dos do |t|
      t.boolean :done ,default: false, null: false
      t.date :deadline
      t.integer :count
      t.text :note
      t.references :to_do_master
      t.references :user
      t.timestamps
    end
  end
end
