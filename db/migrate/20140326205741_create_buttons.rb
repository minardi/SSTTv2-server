class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.string :content
      t.string :glyph
      t.string :show_only
      t.string :show_except

      t.timestamps
    end
  end
end
