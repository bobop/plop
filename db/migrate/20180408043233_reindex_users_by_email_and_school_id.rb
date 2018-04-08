class ReindexUsersByEmailAndSchoolId < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, :email
    add_index :users, [:email, :school_id], :unique => true
  end
end
