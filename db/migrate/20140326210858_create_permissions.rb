class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :button_id
      t.string :page
      t.string :right

      t.timestamps
    end
  end
end
