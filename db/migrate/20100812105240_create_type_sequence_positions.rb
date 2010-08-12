class CreateTypeSequencePositions < ActiveRecord::Migration
  def self.up
    create_table :type_sequence_positions do |t|
      t.integer :exercise_id
      t.string :type_name

      t.timestamps
    end
  end

  def self.down
    drop_table :type_sequence_positions
  end
end
