class CreateLents < ActiveRecord::Migration
  def change
    create_table :lents do |t|
      t.references :main
      t.boolean :is_main
      t.string :name
      t.string :image_full
      t.string :image_thumb

      t.timestamps
    end
  end
end
