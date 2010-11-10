class AddPositionToSingleChoice < ActiveRecord::Migration
  def self.up
    add_column :single_choices, :position, :integer
  end

  def self.down
    remove_column :single_choices, :position
  end
end
