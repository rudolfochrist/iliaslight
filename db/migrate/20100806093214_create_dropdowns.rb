class CreateDropdowns < ActiveRecord::Migration
  def self.up
    create_table :dropdowns do |t|
      t.integer :exercise_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dropdowns
  end
end
