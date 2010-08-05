class CreateMarktexts < ActiveRecord::Migration
  def self.up
    create_table :marktexts do |t|
      t.integer :exercise_id
      t.text :mark

      t.timestamps
    end
  end

  def self.down
    drop_table :marktexts
  end
end
