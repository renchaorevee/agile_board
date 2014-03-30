class AddColumnIdInStickies < ActiveRecord::Migration
  def self.up
    add_column :stickies, :column_id, :integer
  end

  def self.down
  end
end
