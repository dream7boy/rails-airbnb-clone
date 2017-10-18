require "faker"

puts 'Cleaning database...'
User.destroy_all
Pet.destroy_all

puts 'Creating database...'

50.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456",
    is_owner: [true, false].sample,
    location: ["Meguro Station, Shinagawa, Tokyo", "Tokyo Station, Chiyoda, Tokyo", "Shinjuku Station, 3 Chome Shinjuku, Tokyo"].sample
  )

  if user.is_owner
    3.times do
    start_random_date = DateTime.new(2017, 10, rand(1..3))
    pet = Pet.create(
      name: Faker::Pokemon.name,
      species: ["dog", "pokemon"].sample,
      description: Faker::Color.color_name,
      start_date: start_random_date,
      end_date: start_random_date + rand(1..3),
      daily_price: rand(5000..20000).round(-3),
      age: rand(1..10),
      gender: ["F", "M"].sample,
      personality: ["calm", "active"].sample,
      owner_id: user.id,
      location: user.location
    )
    end
  end
end

puts 'Finished!'
