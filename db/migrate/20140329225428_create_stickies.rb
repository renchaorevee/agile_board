class CreateStickies < ActiveRecord::Migration
  def self.up
    create_table :stickies do |t|
      t.string :details
      t.boolean :archived, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :stickies
  end
end
