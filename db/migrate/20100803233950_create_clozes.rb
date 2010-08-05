class CreateClozes < ActiveRecord::Migration
  def self.up
    create_table :clozes do |t|
      t.integer :exercise_id
      t.text :cloze_text

      t.timestamps
    end
  end

  def self.down
    drop_table :clozes
  end
end
