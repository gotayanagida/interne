class CreateScheduleTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_todos do |t|
      t.references :schedule, foreign_key: true
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
