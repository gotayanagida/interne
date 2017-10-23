class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.text :body
      t.string :link
      t.integer :status

      t.timestamps
    end
  end
end
