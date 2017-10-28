class CreateReportTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :report_todos do |t|
      t.references :report, foreign_key: true
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
