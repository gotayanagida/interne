class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :hp_addr
      t.string :number_of_interns
      t.string :home_photo_url
      t.string :icon_photo_url

      t.timestamps
    end
  end
end
