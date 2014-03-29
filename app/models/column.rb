class Column < ActiveRecord::Base
  before_validation :squish_whitespace
  before_validation :assign_default_column_order

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }
  validates :column_order, numericality: { only_integer: true }

  def assign_default_column_order
    self.column_order ||= next_column_order
  end

  private
  def next_column_order
    Column.maximum(:column_order) + 1
  end

  def squish_whitespace
    self.name = self.name.squish! if self.name
  end
end
