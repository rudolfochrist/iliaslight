class CreateSequenceTypes < ActiveRecord::Migration
  def self.up
    create_table :sequence_types do |t|
      t.integer :exercise_id
      t.string :type
      t.intger :type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sequence_types
  end
end
