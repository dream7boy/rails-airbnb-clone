require "faker"

puts 'Cleaning database...'
User.destroy_all
Pet.destroy_all

puts 'Creating database...'

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456",
    is_owner: [true, false].sample
  )

  if user.is_owner
    5.times do
    start_random_date = DateTime.new(2017, rand(1..12), rand(1..28))
    pet = Pet.create(
      name: Faker::Pokemon.name,
      species: ["dog", "cat", "fish", "pokemon", "bird"].sample,
      description: Faker::Color.color_name,
      start_date: start_random_date,
      end_date: start_random_date + rand(1..10),
      owner_id: user.id
    )
    end
  end
end

puts 'Finished!'
