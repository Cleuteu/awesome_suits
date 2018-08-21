puts 'Cleaning database...'
Renting.destroy_all
User.destroy_all
Suit.destroy_all

puts 'Creating users and suits...'

url = ['https://vignette.wikia.nocookie.net/peaky-blinders/images/e/e4/Tommy4.jpg/revision/latest?cb=20171102223157',
      'https://www.tom-murphy.ie/wp-content/uploads/2017/06/Paris-Navy-4-.jpg',
      'http://leblogdemonsieur.com/wp-content/uploads/2014/07/NUP_148281_1176.jpg',
      'https://i.pinimg.com/originals/7b/c6/41/7bc641d539b0c5a3a342d66c213d444c.jpg',
      'https://vignette.wikia.nocookie.net/jamesbond/images/d/dc/James_Bond_%28Pierce_Brosnan%29_-_Profile.jpg/revision/latest?cb=20130506224906',
      'https://cdn-s-www.leprogres.fr/images/CA0517A9-3A47-40DC-8BA9-33134790E59D/LPR_v1_02/title-1479278308.jpg',
      'https://www.usinenouvelle.com/mediatheque/3/4/4/000494443_image_896x598/francois-fillon.jpg',
      'https://www.tuxboard.com/photos/2014/03/bebe-en-costume-7.jpg',
      'http://www.lolpetshop.com/695-large_default/smoking-3-piece-pour-chien.jpg',
      'https://fr.hibapress.com/wp-content/uploads/2018/04/Franck-Ribery-a-l-Elysee_portrait_w674-1.jpg'
]
i = 9
10.times do
  user = User.new(email: Faker::Internet.email,
              password: Faker::Number.number(7),
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name)
  user.save!
  suit = Suit.new(name: Faker::Pokemon.name,
                color: Faker::Color.color_name,
                price_per_day: Faker::Number.between(35, 180),
                size: ['S', 'M', 'L', 'XL'].sample,)
  suit.remote_photo_url = url[i]
  suit.user_id = user.id
  suit.save!
  i -= 1
end

puts 'Creating users Thomas, Eugene, Yoann and Alex'
User.create!(email: 'marichalalex@yahoo.fr', first_name: 'Alex', last_name: 'Marichal', password: 'azerty')
User.create!(email: 'e.ernoult@gmail.com', first_name: 'Eugene', last_name: 'Ernoult', password: 'azerty')
User.create!(email: 'thomas.pouillevet@gmail.com', first_name: 'Thomas', last_name: 'Pouillevet', password: 'azerty')
User.create!(email: 'yoann.saunier@gmail.com', first_name: 'Yoann', last_name: 'Saunier', password: 'azerty')

puts 'Finished!'
