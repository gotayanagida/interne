class CreateTaskSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :task_schedules do |t|
      t.references :task, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
