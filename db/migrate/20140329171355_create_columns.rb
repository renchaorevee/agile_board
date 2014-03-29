class CreateColumns < ActiveRecord::Migration
  def self.up
    create_table :columns do |t|
      t.string  :name, null: false
      t.text    :description
      t.integer :order, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :columns
  end
end
