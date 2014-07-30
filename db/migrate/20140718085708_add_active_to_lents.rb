class AddActiveToLents < ActiveRecord::Migration
  def change
    add_column :lents, :active, :boolean, default: false
  end
end
