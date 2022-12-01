# == Schema Information
#
# Table name: follow_requests
#
#  id           :bigint           not null, primary key
#  status       :string           default("pending")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#
# Indexes
#
#  index_follow_requests_on_recipient_id  (recipient_id)
#  index_follow_requests_on_sender_id     (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
class FollowRequest < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name:"User"

  # use when we have a string or integer that we have a FIXED set of values for IN THIS CASE PENDING, REJECTED, ACCEPTED!!!!!

  # we are ENUMERATING over the status: column!!! so we get a HASH that has all 3 of our FIXED values

  # remember it is a hash.. SOOOOOO we have a KEY AND VALUE that we must account for

  # the enum is just like making scopes that you can generate all in one!!! it basically does all the scopes for each key in the enum!!!!
  # ex: scope :rejected, -> {where (status: "rejected")}

  enum status: { pending: "pending", rejected: "rejected", accepted: "accepted"}

  #we can call them in an instance and run small commands on them!!!

  # follow_request.accepted? # => false
  # follow_request.accepted! # sets status to "accepted" and saves

  #we automatically get a posititive and a negative when it comes to the enum

  # ex: scope :rejected, -> {where status: "rejected")}
  # ex: scope :not_rejected, -> {where.not(status: "rejected")}

  #this is  what actually calling it will look like!!!!!
  # FollowReqest.accepted
  # current_user.received_follow_requests.not_rejected
end
