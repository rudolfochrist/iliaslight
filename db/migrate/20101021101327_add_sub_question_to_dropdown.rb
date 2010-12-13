class AddSubQuestionToDropdown < ActiveRecord::Migration
  def self.up
    add_column :dropdowns, :sub_question, :text
  end

  def self.down
    remove_column :dropdowns, :sub_question
  end
end
