class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.references :school, foreign_key: true
      t.string :name
      t.text :description
      t.text :address
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :slug

      t.timestamps
    end
  end
end
