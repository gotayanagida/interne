class CreateReportNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :report_notices do |t|
      t.references :report, foreign_key: true
      t.references :notice, foreign_key: true

      t.timestamps
    end
  end
end
