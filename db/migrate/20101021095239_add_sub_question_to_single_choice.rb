class AddSubQuestionToSingleChoice < ActiveRecord::Migration
  def self.up
    add_column :single_choices, :sub_question, :string
  end

  def self.down
    remove_column :single_choices, :sub_question
  end
end
