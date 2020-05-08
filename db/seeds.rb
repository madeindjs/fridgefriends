require 'open-uri'

puts "Destroy all instances"
Donation.destroy_all
Relationship.destroy_all
User.destroy_all

puts "Create users"
# DAPHNEE
daph_avatar = File.open("db/fixtures/team/IMG_7636.jpg")
daph = User.new(avatar: daph_avatar, email: "daph@example.com", password: "password", first_name: "Daphnée", last_name: "Duportal", address: "67 Rue Alphonse Guérin, 35000 Rennes")
daph.save!

# JOHNNY
johnny_avatar = File.open("db/fixtures/team/johnny_id_mojfen.jpg")
johnny = User.new(avatar: johnny_avatar, email: "johnny@example.com", password: "password", first_name: "Johnny", last_name: "Girault", address: "1 Rue Émile Souvestre, 35000 Rennes")
johnny.save!

# YANN
yann_avatar = File.open("db/fixtures/team/yann4.jpg")
yann = User.new(avatar: yann_avatar, email: "yann@example.com", password: "password", first_name: "Yann", last_name: "Ropert", address: "34 Rue Honoré de Balzac, 35700 Rennes")
yann.save!

# DOUG
doug_avatar = File.open("db/fixtures/team/doug.png")
doug = User.new(avatar: doug_avatar, email: "doug@example.com", password: "password", first_name: "Doug", last_name: "Delpha", address: "7 Allée Maurice Ravel, 35000 Rennes")
doug.save!

# LASZLO
laszlo_avatar = File.open("db/fixtures/team/laszlo.jpeg")
laszlo = User.new(avatar: laszlo_avatar, email: "laszlo@example.com", password: "password", first_name: "Laszlo", last_name: "Van Daal", address: "Rue des Ormeaux, 35000 Rennes")
laszlo.save!

# CHRIS
chris_avatar = File.open("db/fixtures/team/chris.jpg")
chris = User.new(avatar: chris_avatar, email: "chris@example.com", password: "password", first_name: "Chris", last_name: "Duparquet", address: "15 Rue Pierre et Marie Curie, 35000 Rennes")
chris.save!

# CORENTIN
corentin_avatar = File.open("db/fixtures/team/corentin.jpeg")
corentin = User.new(avatar: corentin_avatar, email: "corentin@example.com", password: "password", first_name: "Corentin", last_name: "Bosseman", address: "90 Rue de la Pilate, 35136 Saint-Jacques-de-la-Lande")
corentin.save!

# REMI
remi_avatar = File.open("db/fixtures/team/remi.jpeg")
remi = User.new(avatar: remi_avatar, email: "remi@example.com", password: "password", first_name: "Rémi", last_name: "Beucherie", address: "31 Rue de la Garenne, 35510 Cesson-Sévigné")
remi.save!

# DAVID
david_avatar = File.open("db/fixtures/team/david.jpeg")
david = User.new(avatar: david_avatar, email: "david@example.com", password: "password", first_name: "David", last_name: "Lefort", address: "3 Rue Charles Beslay, 35700 Rennes")
david.save!

# HUGO
hugo_avatar = File.open("db/fixtures/team/hugo.jpg")
hugo = User.new(avatar: hugo_avatar, email: "hugo@example.com", password: "password", first_name: "Hugo", last_name: "Daniel", address: "3 Rue Charles Beslay, 35700 Rennes")
hugo.save!


#RELATIONSHIPS
puts 'creating relationships'

Relationship.create!(user: doug, friend: daph, status: "accepted")
Relationship.create!(user: doug, friend: yann, status: "accepted")
Relationship.create!(user: johnny, friend: doug, status: "accepted")
Relationship.create!(user: yann, friend: daph, status: "accepted")
Relationship.create!(user: daph, friend: johnny, status: "accepted")
Relationship.create!(user: laszlo, friend: doug, status: "accepted")
Relationship.create!(user: remi, friend: doug, status: "accepted")
Relationship.create!(user: doug, friend: chris, status: "pending")
Relationship.create!(user: corentin, friend: yann, status: "pending")
Relationship.create!(user: doug, friend: laszlo, status: "pending")
Relationship.create!(user: johnny, friend: remi, status: "pending")
Relationship.create!(user: yann, friend: chris, status: "accepted")
Relationship.create!(user: yann, friend: laszlo, status: "accepted")
Relationship.create!(user: yann, friend: johnny, status: "accepted")
Relationship.create!(user: david, friend: doug, status: "pending")
Relationship.create!(user: yann, friend: hugo, status: "accepted")
Relationship.create!(user: doug, friend: hugo, status: "accepted")

#DONATIONS
puts 'creating donations'

url_p_d1 = File.open("db/fixtures/foods/photoD1.png")
d1 = Donation.create!(
  giver: chris,
  status: "pending",
  photo: url_p_d1,
  description: "2 salades\n 2 bouteilles de vin rouge",
  categories: ["drinks", "fruits and vegetables"],
  pick_up: true,
  deadline: Date.today + 1,
)
d1.save!

url_p_d2 = File.open("db/fixtures/foods/photoD2.png")
d2 = Donation.create!(
  giver: daph,
  receiver: johnny,
  status: "confirmed",
  photo: url_p_d2,
  description: "1 kg de pommes de terre\n 14 poires\n 2 bouteilles de bière\n 1 potiron",
  categories: ["drinks", "fruits and vegetables"],
  pick_up: true,
  deadline: Date.today + 4,
)
d2.save!

url_p_d3 = File.open("db/fixtures/foods/avacado.jpeg")
d3 = Donation.create!(
  giver: johnny,
  status: "pending",
  photo: url_p_d3,
  description: "des avocats\n 2 oeufs durs\n des tomates cerises",
  categories: ["fruits and vegetables", "dairy and eggs"],
  pick_up: true,
  deadline: Date.today + 2,
)
d3.save!

url_p_d4 = File.open("db/fixtures/foods/carrots.jpeg")
d4 = Donation.create!(
  giver: daph,
  status: "pending",
  photo: url_p_d4,
  description: "1 kg de carrottes\n 1 bouteille de vin\n 4 oranges",
  categories: ["drinks", "fruits and vegetables"],
  pick_up: true,
  deadline: Date.today,
)
d4.save!

url_p_d5 = File.open("db/fixtures/foods/eggs.jpeg")
d5 = Donation.create!(
  giver: remi,
  status: "pending",
  photo: url_p_d5,
  description: "3 oeufs\n",
  categories: ["dairy and eggs"],
  pick_up: false,
  deadline: Date.today + 1,
)
d5.save!

d6 = Donation.create!(
  giver: johnny,
  receiver: doug,
  status: "confirmed",
  description: "1 salade\n 5 pommes\n 1 bouteille de lait",
  categories: ["fruits and vegetables", "dairy and eggs"],
  pick_up: true,
  deadline: Date.today - 1,
)
d6.save!

d7 = Donation.create!(
  giver: johnny,
  receiver: daph,
  status: "chosen",
  description: "12 oeufs (mes poules ont bien travaillé !)",
  categories: ["dairy and eggs"],
  pick_up: true,
  deadline: Date.today + 2,
)
d7.save!

d8 = Donation.create!(
  giver: corentin,
  status: "pending",
  description: "(URGENT) Bonjour à tous !\n Je pars pour Paris\n Je donne 6 oeufs\n 4 tomates\n 2 crèpes\n du fromage à raclette\n du jus de pomme",
  categories: ["drinks", "fruits and vegetables", "dairy and eggs"],
  pick_up: false,
  deadline: Date.today,
)
d8.save!

url_p_d10 = File.open("db/fixtures/foods/tomato.jpeg")
d10 = Donation.create!(
  giver: remi,
  status: "pending",
  photo: url_p_d10,
  description: "1 kg de tomates\n",
  categories: ["fruits and vegetables"],
  pick_up: true,
  deadline: Date.today + 4,
)
d10.save!

url_p_d11 = File.open("db/fixtures/foods/vegetable.jpeg")
d11 = Donation.create!(
  giver: chris,
  status: "pending",
  photo: url_p_d11,
  description: "une botte d'asperges\n 2 poivrons\n 5 avocats\n une grappe de tomates pas trop mûres\n 1 steak",
  categories: ["fruits and vegetables", "meat and fish"],
  pick_up: true,
  deadline: Date.today + 5,
)
d11.save!

url_p_d13 = File.open("db/fixtures/foods/grapes.jpeg")
d13 = Donation.create!(
  giver: laszlo,
  status: "pending",
  photo: url_p_d13,
  description: "1 kg raisin\n 10 bouteilles de bière à partager (traquenard) ;)\n fromage de brebis",
  categories: ["drinks", "fruits and vegetables", "dairy and eggs"],
  pick_up: false,
  deadline: Date.today + 1,
)
d13.save!

d16 = Donation.create!(
  giver: corentin,
  status: "pending",
  description: "100 g de mâche\n 100 g de fromage (cantal)\n",
  categories: ["dairy and eggs", "fruits and vegetables"],
  pick_up: true,
  deadline: Date.today + 1,
)
d16.save!
