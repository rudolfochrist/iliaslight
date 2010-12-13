class AddSubQuestionToMultipleChoice < ActiveRecord::Migration
  def self.up
    add_column :multiple_choices, :sub_question, :text
  end

  def self.down
    remove_column :multiple_choices, :sub_question
  end
end
