class CreateJoinTableRolesPermissions < ActiveRecord::Migration[5.0]
  def change
    create_join_table :roles, :permissions do |t|
      t.index [:role_id, :permission_id]
      t.index [:permission_id, :role_id]
      t.index [:role_id, :permission_id], unique: true, name: 'role_permission_uniqueness'
    end
  end
end
