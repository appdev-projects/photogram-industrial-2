class Photo < ApplicationRecord
  validates :owner, presence: true
  validates :image, :presence: true

  belongs_to :owner, class_name: "User"

  has_many :comments
  has_many :likes
  has_many :fans, through: :likes
end
