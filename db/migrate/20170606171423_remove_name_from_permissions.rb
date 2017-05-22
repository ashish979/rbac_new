class RemoveNameFromPermissions < ActiveRecord::Migration[5.0]
  def change
    remove_column :permissions, :name, :string
  end
end
