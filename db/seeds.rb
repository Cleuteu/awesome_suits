puts 'Cleaning database...'
User.destroy_all
Suit.destroy_all

puts 'Creating users and suits...'
10.times do
  user = User.new(email: Faker::Internet.email,
              password: Faker::Number.number(7),
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name)
  user.save!
  suit = Suit.new(name: Faker::Pokemon.name,
                color: Faker::Color.color_name,
                price_per_day: Faker::Number.between(35, 180),
                size: ['S', 'M', 'L', 'XL'].sample)
  suit.user_id = user.id
  suit.save!
end

puts 'Creating users Thomas, Eugene, Yoann and Alex'
User.create!(email: 'marichalalex@yahoo.fr', first_name: 'Alex', last_name: 'Marichal', password: 'azerty')
User.create!(email: 'e.ernoult@gmail.com', first_name: 'Eugene', last_name: 'Ernoult', password: 'azerty')
User.create!(email: 'thomas.pouillevet@gmail.com', first_name: 'Thomas', last_name: 'Pouillevet', password: 'azerty')
User.create!(email: 'yoann.saunier@gmail.com', first_name: 'Yoann', last_name: 'Saunier', password: 'azerty')

puts 'Finished!'
