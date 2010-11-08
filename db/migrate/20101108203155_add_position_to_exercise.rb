class AddPositionToExercise < ActiveRecord::Migration
  def self.up
    add_column :exercises, :position, :integer
  end

  def self.down
    remove_column :exercises, :position
  end
end
