class Sticky < ActiveRecord::Base
  validates :details, length: { maximum: 140 }
end
