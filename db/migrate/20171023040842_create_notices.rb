class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.text :body
      t.string :associate_type

      t.timestamps
    end
  end
end
