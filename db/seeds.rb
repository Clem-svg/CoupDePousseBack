# frozen_string_literal: true

User.destroy_all
Garden.destroy_all

# if Doorkeeper::Application.count.zero?
#   Doorkeeper::Application.create!(name: 'React',
#                                   redirect_uri: 'http://localhost:3000/', scopes: '')
# end

User.first_or_create(
  email: 'test@test.test',
  password: 'testtest',
  password_confirmation: 'testtest'
)

Garden.create!(
  title: 'Petit balcon cat-friendly dans les Yvelines',
  description: "Je cherche un petit coup de main pour élaborer un petit potager et fleurir mon balcon.
  Petite contrainte : mes deux chats qui doivent pouvoir grignoter allègrement les feuilles sans
  tomber malade.",
  orientation: 'Sud',
  floor_type: 'Terreau',
  is_available: true,
  parking: true,
  tools_available: false,
  surface: '3',
  street_number: '62',
  street_name: 'Résidence Elysée 2',
  zip_code: '78172',
  city: 'La Celle-Saint-Cloud',
  country: 'France',
  user_id: 1
)

5.times do
  user = User.new(email: "#{Faker::Name.first_name}@yopmail.com", password: 'testtest',
                  password_confirmation: 'testtest')
  user.save!
end
puts '*' * 20
puts 'USERS'
tp User.all

10.times do
  Garden.create!(
    title: [
      'Joli petit jardinet',
      'Magnifique jardin de roses',
      'Terrasse laissée au dépourvu',
      'Splendide Eden',
      'SOS balcon en détresse'
    ].sample,
    description: [
      "Charmant jardin à partager, rempli de camélias et myosotis.
      A besoin d'une main experte pour m'aider à les chouchouter",
      "Jardin dans un état déplorable, laissé à l'abandon par mes parents dans les années 70. J'ai besoin d'aide ASAP",
      "Besoin d'aide pour planter un potager, hors de question de remettre les pieds dans un supermarché",
      "Cherche ami.e pour entretenir ce jardin d'Eden.
      Nous jardinerons nus afin de mieux nous connecter avec la nature.",
      "SOS cucurbitacées ! J'ignore tout du repiquage de ces délicieux arômes, une âme charitable pour m'aider ?"
    ].sample,
    orientation: %w[Nord Sud Est Ouest].sample,
    floor_type: ['Pauvre et humide', 'Riche et humide', 'Pauvre et sec',
                 'Riche et sec'].sample,
    is_available: [true, false].sample,
    parking: [true, false].sample,
    tools_available: [true, false].sample,
    surface: [15, 20, 3, 9, 78].sample,
    street_number: [15, 20, 3, 9, 78].sample,
    street_name: 'rue Victor Hugo',
    zip_code: '78172',
    city: ['Paris', 'Rueil Malmaison', 'Versailles', 'Boulogne'],
    country: 'France',
    user_id: User.ids.sample
  )
end

puts '*' * 20
puts 'GARDENS'
tp Garden.all
