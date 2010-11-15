class AddAuthorToExercise < ActiveRecord::Migration
  def self.up
    add_column :exercises, :author, :string
  end

  def self.down
    remove_column :exercises, :author
  end
end
