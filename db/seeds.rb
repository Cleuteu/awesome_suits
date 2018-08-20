puts 'Cleaning database...'
User.destroy_all
Suit.destroy_all

puts 'Creating users and suits...'
10.times do
  user = User.new(email: Faker::Internet.email,
              password: Faker::Number.number(7))
  user.save!
  suit = Suit.new(name: Faker::Pokemon.name,
                color: Faker::Color.color_name,
                price_per_day: Faker::Number.between(35, 180),
                size: ['S', 'M', 'L', 'XL'].sample)
  suit.user_id = user.id
  suit.save!
end

puts 'Creating users Thomas, Eugene, Yoann and Alex'
User.create!(email: 'marichalalex@yahoo.fr',
              password: 'azerty')
User.create!(email: 'e.ernoult@gmail.com',
              password: 'azerty')
User.create!(email: 'thomas.pouillevet@gmail.com',
              password: 'azerty')
User.create!(email: 'yoann.saunier@gmail.com',
              password: 'azerty')

puts 'Finished!'
