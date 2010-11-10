class AddPositionToMarktext < ActiveRecord::Migration
  def self.up
    add_column :marktexts, :position, :integer
  end

  def self.down
    remove_column :marktexts, :position
  end
end
