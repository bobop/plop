class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.references :user, foreign_key: true
      t.references :school, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.references :division, foreign_key: true
      t.references :grade, foreign_key: true
      t.references :room, foreign_key: true
      t.text :allergies
      t.text :dietry_requirements

      t.timestamps
    end
  end
end
