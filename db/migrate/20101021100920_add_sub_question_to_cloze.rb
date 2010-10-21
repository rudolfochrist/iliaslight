class AddSubQuestionToCloze < ActiveRecord::Migration
  def self.up
    add_column :clozes, :sub_question, :string
  end

  def self.down
    remove_column :clozes, :sub_question
  end
end
