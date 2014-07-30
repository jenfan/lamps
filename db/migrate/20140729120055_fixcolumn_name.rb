class FixcolumnName < ActiveRecord::Migration
  def self.up
    rename_column  :lents, :active, :is_collection
  end
  def self.down
    # rename back if you need or do something else or do nothing
  end
end
