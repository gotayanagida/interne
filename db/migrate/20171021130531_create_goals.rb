class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :detail
      t.integer :span

      t.timestamps
    end
  end
end
