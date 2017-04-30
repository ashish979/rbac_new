class CreateJoinTableRolesUsers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :roles, :users do |t|
      t.index [:role_id, :user_id]
      t.index [:user_id, :role_id]
      t.index [:role_id, :user_id], unique: true, name: 'role_user_uniqueness'
    end
  end
end
