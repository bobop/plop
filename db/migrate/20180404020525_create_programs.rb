class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.references :school, foreign_key: true
      t.string :name
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end
