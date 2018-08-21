puts 'Cleaning database...'
Renting.destroy_all
User.destroy_all
Suit.destroy_all

puts 'Creating users and suits...'

url_suit = ['https://vignette.wikia.nocookie.net/peaky-blinders/images/e/e4/Tommy4.jpg/revision/latest?cb=20171102223157',
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

url_user = ['https://vignette.wikia.nocookie.net/peaky-blinders/images/9/93/Tommyportrait2.png/revision/latest?cb=20171106170631',
            'https://media.gq.com/photos/56eb1c3f1740841549748e55/master/w_1600/david-beckham-gq-0416-2.jpg',
            'https://www.sabreakingnews.co.za/wp-content/uploads/2015/08/gabriel-macht.jpg',
            'https://ih1.redbubble.net/image.418403076.5841/flat,550x550,075,f.jpg',
            'http://www.cowboysindians.com/wp-content/uploads/2017/03/BrosnanQA.jpg',
            'http://static1.purepeople.com/articles/8/85/84/8/@/682557-dsk-tout-sourire-au-tribunal-deja-950x0-1.jpg',
            'https://www.challenges.fr/assets/img/2016/11/19/cover-r4x3w1000-5830b338e2c9a-franc-ois-fillon-bio.jpg',
            'https://cache.magicmaman.com/data/photo/w1000_ci/4w/bain-bebe-baignoire.jpg',
            'https://static-cdn.jtvnw.net/jtv_user_pictures/hsdogdog-profile_image-5550ade194780dfc-300x300.jpeg',
            'https://www.101greatgoals.com/wp-content/uploads/2016/05/Riberyeyegouge.jpg'
]

i = 9
10.times do
  user = User.new(email: Faker::Internet.email,
              password: Faker::Number.number(7),
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name)
  user.remote_photo_url = url_user[i]
  user.save!
  suit = Suit.new(name: Faker::Pokemon.name,
                color: Faker::Color.color_name,
                price_per_day: Faker::Number.between(35, 180),
                size: ['S', 'M', 'L', 'XL'].sample,)
  suit.remote_photo_url = url_suit[i]
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
