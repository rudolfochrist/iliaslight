class CreateSingleChoices < ActiveRecord::Migration
  def self.up
    create_table :single_choices do |t|
      t.integer :exercise_id

      t.timestamps
    end
  end

  def self.down
    drop_table :single_choices
  end
end
