class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :address, null: false

      t.string :web_site

      t.integer :contact_person_id

      t.timestamps
    end
  end
end
