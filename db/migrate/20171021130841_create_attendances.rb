class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :user, foreign_key: true
      t.datetime :work_started_at
      t.datetime :work_ended_at
      t.integer :num_of_edit

      t.timestamps
    end
  end
end
