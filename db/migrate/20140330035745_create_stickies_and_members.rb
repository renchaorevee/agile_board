class CreateStickiesAndMembers < ActiveRecord::Migration
  def self.up
    create_table :stickies_owners do |t|
      t.integer :sticky_id
      t.integer :user_id

      t.timestamps
    end

    add_index :stickies_owners, :sticky_id
    add_index :stickies_owners, :user_id
    add_index :stickies_owners, [:sticky_id, :user_id], :unique=>true
  end

  def self.down
    drop_table :stickies_owners
  end
end
