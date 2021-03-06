class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :address, null: false
      t.string :position, null: false

      t.belongs_to :company

      t.timestamps
    end
  end
end
