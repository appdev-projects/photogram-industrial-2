task sample_data: :environment do
  p "Creating sample data"

  12.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name.downcase,
      private: [true, false].sample,
    )
  end
  p "#{User.count} users have been created."
end
