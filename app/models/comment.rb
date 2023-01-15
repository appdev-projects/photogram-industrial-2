# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :bigint           not null
#  photo_id   :bigint           not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  validates :commenter, presence: true
  validates :photo, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :photo
end
