# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

User.destroy_all
Garden.destroy_all

if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create!(name:"web Client", redirect_uri:"http://localhost:3000/", scopes: "")
    Doorkeeper::Application.create!(name:"React", redirect_uri:"http://localhost:3000/", scopes: "")
end

User.first_or_create(
    email: 'test@test.test',
    password: 'testtest',
    password_confirmation: 'testtest'
)


20.times do
  user = User.new(email: Faker::Name.first_name+"@yopmail.com", password: 'testtest', password_confirmation: 'testtest')
  user.save!
end
puts "*" * 20
puts "USERS"
tp User.all

#pictures_array = ["https://images.unsplash.com/photo-1558521558-037f1cb027c5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1580600301354-0ce8faef576c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1557429287-b2e26467fc2b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1334&q=80","https://images.unsplash.com/photo-1557932937-1b5843aa7968?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=752&q=80","https://images.unsplash.com/photo-1444392061186-9fc38f84f726?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1652&q=80","https://images.unsplash.com/photo-1559321224-548cf5cd67c1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1334&q=80","https://images.pexels.com/photos/126271/pexels-photo-126271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/7283/garden.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/92933/pexels-photo-92933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/145685/pexels-photo-145685.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/334978/pexels-photo-334978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/130154/pexels-photo-130154.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/147640/pexels-photo-147640.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260","https://images.pexels.com/photos/7294/garden.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"]

20.times do
  Garden.create!(
    title: "Jardin de "+Faker::Superhero.name+" besoin d'aide urgente pour planter des "+["choux","poux","genoux","cailloux"].sample,
    description: ["Charmant jardin à partager, rempli de camélias, hêtres et myosotis. A besoin d'une main experte pour m'aider à les chouchouter", "Jardin dans un état déplorable, laissé à l'abandon par mes parents dans les années 70. J'ai besoin d'aide ASAP","Besoin d'aide pour planter un potager dans ce jardinet. Hors de question de remettre les pieds dans un supermarché", "Besoin d'aide pour entretenir ce jardin d'éden. Nous jardinerons nus afin de mieux nous connecter avec la nature.","SOS cucurbitacées ! J'ignore tout du repiquage de ces délicieux arômes, une âme charitable pour m'aider ?"].sample,
    orientation: ["Nord", "Sud","Est","Ouest"].sample,
    floor_type: ["Pauvre et humide","Riche et humide","Pauvre et sec", "Riche et sec"].sample,
    is_available: Faker::Boolean.boolean,
    parking: Faker::Boolean.boolean,
    tools_available: Faker::Boolean.boolean,
    surface: Faker::Number.between(from: 10, to: 300),
    # image_url: pictures_array[rand(pictures_array.length)],
    street_number: Faker::Number.between(from: 1, to: 150),
    street_name: Faker::Address.street_name,
    zip_code: "78172",
    city: Faker::Address.city,
    country: Faker::Address.country,
    user_id: User.ids.sample,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
)
end

puts "*" * 20
puts "GARDENS"
tp Garden.all