# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  image          :string
#  comments_count :integer          default(0)
#  likes_count    :integer          default(0)
#  caption        :text
#  owner_id       :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Photo < ApplicationRecord
  # cool... because we used refrences we had an association already defined for us once we migrated the code
  # remember if we go agianst convention we need to include class_name: "User" ... we chose ot call our foreign key owner instead of user
  belongs_to :owner, class_name: "User"

  has_many :comments
end
