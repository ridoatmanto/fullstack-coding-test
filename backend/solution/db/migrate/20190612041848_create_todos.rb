class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :done_flag, default: 'false'
      t.date :deadline

      t.timestamps
    end
  end
end
