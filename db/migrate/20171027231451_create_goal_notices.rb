class CreateGoalNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_notices do |t|
      t.references :goal, foreign_key: true
      t.references :notice, foreign_key: true

      t.timestamps
    end
  end
end
