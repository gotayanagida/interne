class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.datetime :work_started_at
      t.datetime :work_ended_at

      t.timestamps
    end
  end
end
