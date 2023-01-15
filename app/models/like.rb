# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  fan_id     :bigint           not null
#  photo_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  validates :fan, presence: true
  validates :photo, presence: true

  belongs_to :fan, class_name: "User"
  belongs_to :photo
end
