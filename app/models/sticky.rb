class Sticky < ActiveRecord::Base
  belongs_to :column

  validates :details, length: { maximum: 140 }
  validates :column_id, presence: true, numericality: { only_integer: true }
end
