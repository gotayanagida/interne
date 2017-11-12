class CreateLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :labels do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.string :color
      t.integer :counter

      t.timestamps
    end
  end
end
