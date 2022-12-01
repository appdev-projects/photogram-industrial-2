#LOOOOOOOOK THE INFORMATION IS PROVIDED THROUGH A GEM REMEMBER HOW TO USE IT!!!

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  comments_count         :integer
#  email                  :citext           default(""), not null
#  encrypted_password     :string           default(""), not null
#  likes_count            :integer
#  photos_count           :integer          default(0)
#  private                :boolean          default(TRUE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, foreign_key: :author_id

  has_many :sent_follow_requests, foreign_key: :sender_id, class_name: "FollowRequest"
  
# introducing the PROC, a nameless block of code that we can use... in this case we are calling it on the collection of sent_follow_request
# this will give us all of the users that have a status of accepted.. see columns !
  has_many :accepted_sent_follow_requests, -> {accepted}, foreign_key: :sender_id, class_name: "FollowRequest"

  has_many :received_follow_requests, foreign_key: :recipient_id, class_name: "FollowRequest"

  # we are literally calling the enum from FollowRequests and now we can just include it here to check for accepted!!!!
  has_many :accepted_received_follow_requests, -> {accepted}, foreign_key: :recipient_id, class_name: "FollowRequest"

  has_many :likes, foreign_key: :fan_id

  has_many :own_photos, foreign_key: :owner_id, class_name: "Photo"

  has_many :liked_photos, through: :likes, source:  :photo

  has_many :leaders, through: :accepted_sent_follow_requests, source: :recipient 

  has_many :followers, through: :accepted_received_follow_requests, source: :sender

  #ENGLISH: we get our :feed through: our :leaders and the :source that we want is their :own_photos because the whole point of :feed is to
  # see what the :photos of our :leaders is!!!!
  has_many :feed, through: :leaders, source: :own_photos

  #we are not going through followers because we do not care about what they are likeing
  # and we can only really show one :likes_photos 
  has_many :discover, through: :leaders, source: :liked_photos

  validates :username, presence: true, uniqueness: true

  # SCOPES!!! we use scopes to add logic whenever we see it repeated 2-3 times in our models
  # we can later chain them together and manipulate them whenever we want to update their funcitonality 
  # We put then in PROCS again so rememver that is how we use them!
  # see github for how to use scopes

  #use it on the Active Recodord ex: Photo.past_week ORRRRR on a association ex: current_user.discover.bylikes 
  scope :past_week, -> { where(created_at: 1.week.ago...) }

  scope :by_likes, -> { order(likes_count: :desc) }
end
