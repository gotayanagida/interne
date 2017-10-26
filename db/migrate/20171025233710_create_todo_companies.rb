class CreateTodoCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_companies do |t|
      t.references :todo, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
