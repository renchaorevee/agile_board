class Sticky < ActiveRecord::Base
  belongs_to :column

  validates :details, length: { maximum: 140 }
  validates :column_id, presence: true, numericality: { only_integer: true }

  has_many :sticky_owners, foreign_key: "sticky_id", class_name: "StickiesOwners", dependent: :destroy
  has_many :owners, through: :sticky_owners, source: :user
end
