class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.references :schedule, foreign_key: true
      t.datetime :work_started_at
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
