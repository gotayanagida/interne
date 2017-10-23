class CreateNoticeUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :notice_users do |t|
      t.references :user, foreign_key: true
      t.references :notice, foreign_key: true

      t.timestamps
    end
  end
end
