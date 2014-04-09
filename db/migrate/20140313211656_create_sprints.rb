class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :title
      t.string :description
      t.integer :project_id
      t.string :start
      t.string :finish
      t.string :status

      t.timestamps
    end
  end
end
