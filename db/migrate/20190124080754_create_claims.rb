class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.integer :price_drop
      t.integer :percentage_drop
      t.integer :cap_drop
      t.integer :traded_inflation
      t.integer :signed_losses
      t.integer :total_potential_income
      t.integer :current_potential_income

      t.integer :status, default: 0

      t.boolean :data_provided, default: false
      t.boolean :likely_bookbuild, default: false

      t.belongs_to :company

      t.timestamps
    end
  end
end
