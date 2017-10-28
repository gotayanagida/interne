class CreateStamps < ActiveRecord::Migration[5.1]
  def change
    create_table :stamps do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
