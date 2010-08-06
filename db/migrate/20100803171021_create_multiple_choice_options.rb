class CreateMultipleChoiceOptions < ActiveRecord::Migration
  def self.up
    create_table :multiple_choice_options do |t|
      t.integer :multiple_choice_id
      t.boolean :check
      t.string :option

      t.timestamps
    end
  end

  def self.down
    drop_table :multiple_choice_options
  end
end
