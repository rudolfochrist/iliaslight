class AddSubQuestionToCloze < ActiveRecord::Migration
  def self.up
    add_column :clozes, :sub_question, :text
  end

  def self.down
    remove_column :clozes, :sub_question
  end
end
