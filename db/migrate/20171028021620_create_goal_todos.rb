class CreateGoalTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_todos do |t|
      t.references :goal, foreign_key: true
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
