class CreateTaskNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :task_notices do |t|
      t.references :task, foreign_key: true
      t.references :notice, foreign_key: true

      t.timestamps
    end
  end
end
