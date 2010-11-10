class AddPositionToDropdown < ActiveRecord::Migration
  def self.up
    add_column :dropdowns, :position, :integer
  end

  def self.down
    remove_column :dropdowns, :position
  end
end
