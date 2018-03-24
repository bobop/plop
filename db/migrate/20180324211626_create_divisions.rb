class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions do |t|
      t.references :school, foreign_key: true
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
