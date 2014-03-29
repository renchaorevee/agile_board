class RenameOrderColumnInColumns < ActiveRecord::Migration
  def self.up
    rename_column :columns, :order, :column_order
  end

  def self.down
  end
end
