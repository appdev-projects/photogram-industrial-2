task sample_data_agustin: :environment do

  FollowRequest.delete_all
  Comment.delete_all
  Like.delete_all
  Photo.delete_all
  User.delete_all

  #Users
  12.times do
  username = Faker::Name.unique.first_name
  email = username + "@example.com"
  password = "password"
  random_boolean = [true, false].sample
  
  new_user = User.new
  new_user.username = username
  new_user.email = email
  new_user.password = password
  new_user.private = random_boolean

  new_user.save
  end

  #Photos
  50.times do
    
    ph = Photo.create(caption: Faker::Quote.yoda,
      image: Faker::Avatar.image,
      owner_id: User.all.sample.id )
  end

  #Follow_requests

  100.times do
    f = FollowRequest.create(recipient_id: User.all.sample.id, sender_id: User.all.sample.id, status: FollowRequest.statuses.values.sample)
  end

  #Likes

  100.times do
    l = Like.create(fan_id: User.all.sample.id, 
      photo_id: Photo.all.sample.id) 
  end

    #Comments

  70.times do
    c = Comment.create(author_id: User.all.sample.id, 
      photo_id: Photo.all.sample.id, body: Faker::Quote.yoda)
  end    


  p "There are now #{User.count} users."
  p "There are now #{FollowRequest.count} follow requests."
  p "There are now #{Photo.count} photos."
  p "There are now #{Like.count} likes."
  p "There are now #{Comment.count} comments."
end