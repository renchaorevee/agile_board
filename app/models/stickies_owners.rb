class StickiesOwners < ActiveRecord::Base
  validates :sticky_id,  :presence => true
  validates :user_id,  :presence => true

  belongs_to :sticky, class_name: "Sticky"
  belongs_to :user, class_name: "User"
end