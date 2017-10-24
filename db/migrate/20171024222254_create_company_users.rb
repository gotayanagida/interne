class CreateCompanyUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :company_users do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :association_status

      t.timestamps
    end
  end
end
