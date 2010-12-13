class AddSubQuestionToMarktext < ActiveRecord::Migration
  def self.up
    add_column :marktexts, :sub_question, :text
  end

  def self.down
    remove_column :marktexts, :sub_question
  end
end
