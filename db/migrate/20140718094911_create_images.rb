class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :lent, index: true
      t.string :image_full

      t.timestamps
    end
  end
end
