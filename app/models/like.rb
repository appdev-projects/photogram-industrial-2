class Like < ApplicationRecord
  validates :fan, presence: true
  validates :photo, presence: true

  belongs_to :fan, class_name: "User"
  belongs_to :photo
end
