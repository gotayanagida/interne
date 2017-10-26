class CreateNoticeCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :notice_companies do |t|
      t.references :notice, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
