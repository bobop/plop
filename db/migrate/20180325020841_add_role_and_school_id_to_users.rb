class AddRoleAndSchoolIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string, default: 'parent'
    add_reference :users, :school, foreign_key: true
  end
end
