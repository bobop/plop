class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :address
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :slug

      t.timestamps
    end

    add_index :schools, :slug, unique: true
  end
end
