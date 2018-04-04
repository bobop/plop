class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :program, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :start_at
      t.string :slug

      t.timestamps
    end
  end
end
