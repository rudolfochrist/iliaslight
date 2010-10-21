class AddSubQeustionToMultipleChoice < ActiveRecord::Migration
  def self.up
    add_column :multiple_choices, :sub_question, :string
  end

  def self.down
    remove_column :multiple_choices, :sub_question
  end
end
