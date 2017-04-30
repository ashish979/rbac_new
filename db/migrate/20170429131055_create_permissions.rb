class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :description
      t.string :action
      t.string :subject_class
      t.integer :subject_id
      t.string :uuid

      t.timestamps
      t.index :uuid, unique: true
    end
  end
end
