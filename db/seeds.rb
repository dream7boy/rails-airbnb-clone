require "faker"

puts 'Cleaning database...'
User.destroy_all
Pet.destroy_all

puts 'Creating database...'

5.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456",
    is_owner: [true, false].sample,
    location: ["Meguro Station, Shinagawa, Tokyo", "Tokyo Station, Chiyoda, Tokyo", "Shinjuku Station, 3 Chome Shinjuku, Tokyo"].sample
  )

  if user.is_owner
    3.times do
      start_random_date = DateTime.new(2017, 10, rand(21..23))
      pet = Pet.create!(
        name: Faker::Pokemon.name,
        species: ["Chincilla", "Crocodile"].sample,
        description: Faker::Color.color_name,
        start_date: start_random_date,
        end_date: start_random_date + rand(1..3),
        daily_price: rand(5000..20000).round(-3),
        age: rand(1..10),
        gender: ["Female", "Male"].sample,
        personality: ["calm", "active"].sample,
        owner_id: user.id,
        location: user.location
        )

      photo_urls = {
        "Chincilla" => "http://www.wordsiseek.com/wp-content/uploads/2017/10/Chinchilla.png",
        "Crocodile" => "https://cdnimg.in/wp-content/uploads/2016/04/c5.jpg?2bbdf3"
      }

      pet.remote_photo_url = photo_urls[pet.species]
      pet.save

    end
  end
end

puts 'Finished!'
