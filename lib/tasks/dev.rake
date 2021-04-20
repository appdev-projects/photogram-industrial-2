task sample_data: :environment do


  12.times do
  username = Faker::Name.unique.first_name
  email = username+"@example.com"
  password = "password"
  random_boolean = [true, false].sample
  
  new_user = User.new
  new_user.username = username
  new_user.email = email
  new_user.password = password
  new_user.private = random_boolean

  new_user.save
  end

  p "There are now #{User.count} users."
end