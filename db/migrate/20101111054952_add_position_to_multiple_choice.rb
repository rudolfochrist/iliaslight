class AddPositionToMultipleChoice < ActiveRecord::Migration
  def self.up
    add_column :multiple_choices, :position, :integer
  end

  def self.down
    remove_column :multiple_choices, :position
  end
end
