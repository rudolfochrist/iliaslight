class CreateSequenceLines < ActiveRecord::Migration
  def self.up
    create_table :sequence_lines do |t|
      t.integer :exercise_id
      t.string :question_type

      t.timestamps
    end
  end

  def self.down
    drop_table :sequence_lines
  end
end
