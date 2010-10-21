class AddSubQuestionToDropdown < ActiveRecord::Migration
  def self.up
    add_column :dropdowns, :sub_question, :string
  end

  def self.down
    remove_column :dropdowns, :sub_question
  end
end
