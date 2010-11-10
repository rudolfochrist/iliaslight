class AddPositionToCloze < ActiveRecord::Migration
  def self.up
    add_column :clozes, :position, :integer
  end

  def self.down
    remove_column :clozes, :position
  end
end
