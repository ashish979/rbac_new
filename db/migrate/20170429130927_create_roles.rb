class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.string :uuid

      t.timestamps
      t.index :uuid, unique: true
    end
  end
end
