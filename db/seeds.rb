puts 'Cleaning database...'
Review.destroy_all
Message.destroy_all
Renting.destroy_all
Suit.destroy_all
User.destroy_all

puts 'Creating users, suits, rentings and messages...'

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


first_names_users = ['Tommy', 'David', 'Gabriel', 'Barney', 'James', 'Dodo', 'Francois', 'Baby', 'Medor', 'Frank']
last_names_users = ['Shelby', 'Beckham', 'Macht', 'Stinson', 'Bond', 'La Saumur', 'Fillon', 'Goodboy', 'Ribery']
suits_names = ['The Grace', 'The soccer suit', 'Gentleman\'s suit', 'How I will **** your mother', 'Suit shaken, not stirred', 'Le Nafissatou',
                '#rendsl\'argent', 'Impress your mom', 'Le wouf', 'Le kostume classe tmtc']

suits_address = [ '64, rue de la Hulotais SAINT-QUENTIN france',
                  '16 Rue Réaumur Paris France',
                  '4 Rue Paradis, Marseille, France',
                  '15 Rue Léon Gambetta, Lille, France',
                  '2 Rue de Strasbourg, Nantes, France',
                  '14 Rue des Marchands, Colmar, France',
                  '23 Rue de Toulon, Toulouse, France',
                  '2 Rue Paul Vaillant Couturier, Argenteuil, France',
                  '15 Rue Marc Massy, Saint-Germain, France',
                  '3 Rue Maréchal Foch, Perpignan, France'
                ]

message_content1 = 'Bonjour, je dois participer à l\'enterrement du poisson poisson rouge du meilleur ami de mon oncle par alliance,
                   et j\ai vraiment la flemme de dépenser un costume à 500 balles pour ça... Le votre semble très adapté pour ce type
                   d\événement. Est-il toujours disponible?'

message_content2 = 'Bonjour Monsieur,\n Je l\'ai moi-même porté la semaine dernière à la bar mitzvah de mon chien, il est en effet du plus bel effet
                    pour ce type de manifestation. Il est toujours disponible et je valide votre demande de réservation.'

review1_content = 'Ce costume sentait vraiment mauvais... je l\'avais pris pour un rendez-vous Tinder, je peux vous dire que je suis rentré tout seul!'
review2_content = 'Je loue ce costume très régulièrement. Je me suis aperçu qu\'il me donner une certaine chance, depuis que je le met, tous mes problèmes ont été résolus! Je conseille'

i = 9
10.times do
  user = User.new(email: Faker::Internet.email,
              password: 'azerty',
              first_name: first_names_users[i],
              last_name: last_names_users[i],
              phone: "06#{Faker::Number.number(8)}" )
  user.remote_photo_url = url_user[i]
  user.save!
  suit = Suit.new(name: suits_names[i],
                color: ["Blue", "Black", "Red", "Yellow", "Green", "Purple"].sample,
                price_per_day: Faker::Number.between(35, 180),
                style: [ 'Classic suit', 'Elegant tuxedo', 'Eccentic suit'].sample,
                size: ['S', 'M', 'L', 'XL'].sample,
                address: suits_address[i])
  suit.remote_photo_url = url_suit[i]
  suit.user_id = user.id
  suit.save!

  renting1 = Renting.new(start_date: Date.new(2018,8,28), end_date: Date.new(2018,8,30))
  renting2 = Renting.new(start_date: Date.new(2018,8,26), end_date: Date.new(2018,8,27))

  renting1.suit = suit
  renting2.suit = suit

  renting1.user = user
  renting2.user = user

  renting1.save!
  renting2.save!

  review1 = Review.new(date: Date.new(2018,8,16), title: 'Sentait mauvais...', rate: 2, content: review1_content)
  review2 = Review.new(date: Date.new(2018,8,19), title: 'Ce costume a changé ma vie!', rate: 5, content: review1_content)

  review1.renting = renting1
  review2.renting = renting1

  review1.user = user
  review2.user = user

  review1.save!
  review2.save!


  message1 = Message.new(content:message_content1, date: Date.new(2018,8,16))
  message2 = Message.new(content: message_content2, date: Date.new(2018,8,20))

  message1.renting = renting1
  message2.renting = renting1

  message1.user = user
  message2.user = user

  message1.save!
  message2.save!

  i -= 1
end

puts 'Creating test user'
user = User.new(email: 'test@test.com', first_name: 'Alex', last_name: 'Marichal', password: '123456')
user.save!

suit = Suit.new(name: 'Un bon gros suit',
              color: 'Yellow',
              price_per_day: Faker::Number.between(35, 180),
              style: [ 'Classic suit', 'Elegant tuxedo', 'Eccentic suit'].sample,
              size: ['S', 'M', 'L', 'XL'].sample,
              address: '16 villa gaudelet Paris')
suit.remote_photo_url = 'https://www.opposuits.com/media/catalog/product/cache/16/image/550x/925f46717e92fbc24a8e2d03b22927e1/o/s/osui_shineapple_website_rgb_ls_1.jpg'
suit.user = user

suit.save!

renting1 = Renting.new(start_date: Date.new(2018,8,28), end_date: Date.new(2018,8,30))
renting2 = Renting.new(start_date: Date.new(2018,8,26), end_date: Date.new(2018,8,27))

renting1.suit = suit
renting2.suit = suit

renting1.user = user
renting2.user = user

renting1.save!
renting2.save!

review1 = Review.new(date: Date.new(2018,8,16), title: 'Sentait mauvais...', rate: 2, content: review1_content)
review2 = Review.new(date: Date.new(2018,8,19), title: 'Ce costume a changé ma vie!', rate: 5, content: review1_content)

review1.renting = renting1
review2.renting = renting1

review1.user = user
review2.user = user

review1.save!
review2.save!


message1 = Message.new(content:message_content1, date: Date.new(2018,8,16))
message2 = Message.new(content: message_content2, date: Date.new(2018,8,20))

message1.renting = renting1
message2.renting = renting1

message1.user = user
message2.user = user

message1.save!
message2.save!

puts 'Finished!'
