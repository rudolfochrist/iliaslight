class CreateOrderEntries < ActiveRecord::Migration
  def self.up
    create_table :order_entries do |t|
      t.integer :exercise_id
      t.string :question_type
      t.integer :id_of_type

      t.timestamps
    end
  end

  def self.down
    drop_table :order_entries
  end
end
