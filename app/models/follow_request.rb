class FollowRequest < ApplicationRecord
  validates :recipient, presence: true
  validates :sender, presence: true

  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"
end
