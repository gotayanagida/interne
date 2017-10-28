class CreateGoalStamps < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_stamps do |t|
      t.references :goal, foreign_key: true
      t.references :stamp, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
