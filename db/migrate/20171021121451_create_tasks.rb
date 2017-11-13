class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      # t.references :user, foreign_key: true, null: true
      t.references :company, foreign_key: true
      t.string :title
      t.text :detail
      t.integer :status_code

      t.timestamps
    end
  end
end
