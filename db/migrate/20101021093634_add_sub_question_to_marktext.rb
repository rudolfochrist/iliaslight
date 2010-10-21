class AddSubQuestionToMarktext < ActiveRecord::Migration
  def self.up
    add_column :marktexts, :sub_question, :string
  end

  def self.down
    remove_column :marktexts, :sub_question
  end
end
