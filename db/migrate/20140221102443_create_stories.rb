class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.string :project_id
      t.string :status
      t.string :sprint_id

      t.timestamps
    end
  end
end
