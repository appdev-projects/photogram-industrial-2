# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  caption        :text
#  comments_count :integer          default(0)
#  image          :string
#  likes_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :bigint           not null
#
# Indexes
#
#  index_photos_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Photo < ApplicationRecord
  # cool... because we used refrences we had an association already defined for us once we migrated the code
  # remember if we go agianst convention we need to include class_name: "User" ... we chose ot call our foreign key owner instead of user
  belongs_to :owner, class_name: "User", counter_cache: true

  has_many :comments

  has_many :likes

  #we don't need source because we are using convetion and in like.rb we already have :fan, so we do not need to specify it here
  has_many :fans, through: :likes

  validates :caption, presence: true

  validates :image, presence: true
end
