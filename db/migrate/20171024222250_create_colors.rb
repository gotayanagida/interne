class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :main
      t.string :bg
      t.string :grad_1
      t.string :grad_2

      t.timestamps
    end
  end
end
