class CreateDropdownDefinitions < ActiveRecord::Migration
  def self.up
    create_table :dropdown_definitions do |t|
      t.integer :dropdown_id
      t.string :definition

      t.timestamps
    end
  end

  def self.down
    drop_table :dropdown_definitions
  end
end
