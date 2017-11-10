class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :hp_addr
      t.string :home_photo_url, default: "home.png"
      t.string :icon_photo_url, default: "pf.jpg"

      t.timestamps
    end
  end
end
