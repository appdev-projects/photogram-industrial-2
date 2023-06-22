task sample_data: :environment do

  p "Creating sample data"
  starting = Time.now

    if Rails.env.development?
      FollowRequest.destroy_all
      Comment.delete_all
      Like.delete_all
      Photo.delete_all
      User.destroy_all
    end
  
    usernames = Array.new { Faker::Name.first_name }

    usernames << "alice"
    usernames << "bob"

    usernames.each do |username|
    name = Faker::Name.first_name.downcase
    u = User.create(
      email: "#{username}@example.com",
      username: username.downcase,
      password: "password",
      private: [true, false].sample
    )
    p u.errors.full_messages
  end

  users = User.all

  users.each do |first_user|
    users.each do |second_user|
      if rand < 0.75
        first_user.sent_follow_requests.create(
          recipient: second_user,
          status: FollowRequest.statuses.values.sample
        )
      end
      if rand < 0.75
          second_user.sent_follow_requests.create(
          recipient: first_user,
          status: FollowRequest.statuses.values.sample
        )
      end
    end
  end

  users.each do |user|
    rand(10).times do
      photo = user.own_photos.create(
        caption: Faker::Quote.famous_last_words,
        image: "https://robohash.org/#{rand(9999)}"
      )
  
      user.followers.each do |follower|
        if rand < 0.5
          new_like = photo.likes.create(fan: follower)
        end
  
        if rand < 0.25
          photo.comments.create(
            body: Faker::Quote.robin,
            author: follower
          )
        end
      end
    end
  end
  

  ending = Time.now

  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{FollowRequest.count} follow requests."
  p "There are now #{Photo.count} photos."
  p "There are now #{Like.count} likes."
  p "There are now #{Comment.count} comments."

end
