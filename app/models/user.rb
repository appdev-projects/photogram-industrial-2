class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :own_photos, class_name: "Photo", foreign_key: "owner_id"
  has_many :comments, class_name: "Comment", foreign_key: "author_id"
  has_many :follow_requests_received, class_name: "FollowRequest", foreign_key: "recipient_id"
  has_many :follow_requests_sent, class_name: "FollowRequest", foreign_key: "sender_id"
  has_many :likes, class_name: "Like", foreign_key: "fan_id"
end
