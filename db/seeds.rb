require "faker"

puts 'Cleaning database...'
User.destroy_all
Pet.destroy_all

puts 'Creating database...'

6.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456",
    is_owner: [true, false].sample
  )

  if user.is_owner
    2.times do
    pet = Pet.create(
      name: Faker::Pokemon.name,
      species: ["dog", "cat", "fish", "pokemon", "bird"].sample,
      description: Faker::Color.color_name,
      owner_id: user.id
    )
    end
  end
end

puts 'Finished!'
