class CreateDropdownOptions < ActiveRecord::Migration
  def self.up
    create_table :dropdown_options do |t|
      t.integer :dropdown_definition_id
      t.boolean :check
      t.string :option

      t.timestamps
    end
  end

  def self.down
    drop_table :dropdown_options
  end
end
