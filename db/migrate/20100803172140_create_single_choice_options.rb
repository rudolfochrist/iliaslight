class CreateSingleChoiceOptions < ActiveRecord::Migration
  def self.up
    create_table :single_choice_options do |t|
      t.integer :exercise_id
      t.boolean :check
      t.string :option

      t.timestamps
    end
  end

  def self.down
    drop_table :single_choice_options
  end
end
