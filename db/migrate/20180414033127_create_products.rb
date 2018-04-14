class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :school, foreign_key: true
      t.references :supplier, foreign_key: true
      t.references :product_category, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :sale_price, precision: 5, scale: 2
      t.decimal :cost_price, precision: 5, scale: 2
      t.string :slug

      t.timestamps
    end
  end
end
