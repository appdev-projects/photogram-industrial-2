class Comment < ApplicationRecord
  validates :commenter, presence: true
  validates :photo, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :photo
end
