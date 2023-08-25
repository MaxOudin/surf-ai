# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Review.destroy_all
Booking.destroy_all
Board.destroy_all
User.destroy_all

photos_long = [
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692964620/longboard-900-9-67-l-livre-avec-2-1-aileron-central-de-8_vy6hwf.jpg",
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692964620/longboard-900-9-67-l-livre-avec-2-1-aileron-central-de-8_1_ahuor1.jpg",
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692964619/longboard-900-9-67-l-livre-avec-2-1-aileron-central-de-8_2_zkelxt.jpg"
]

photos_long2 = [
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692804703/production/a23tifqrh2sj0ln5g2j67au9zzss.jpg",
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692804706/production/v63uy2gbe670h56c984bp6xrnh43.jpg",
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692804705/production/zwzmp8r6ucavcf9mo2doden9a4yz.jpg"
]

photos_short = [
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692953861/shortboard-900-61-33l-livre-avec-3-ailerons-fcs2_pjhzjf.jpg",
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692953861/shortboard-900-61-33l-livre-avec-3-ailerons-fcs2_1_p1vtqb.jpg",
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692953861/shortboard-900-61-33l-livre-avec-3-ailerons-fcs2_2_vatym0.jpg"
]

photos_fish = [
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692800273/production/7irevbn4ffuqqkgctvn5sqyqnrs9.jpg",
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692800271/production/qtmh1ux2qzm8focro06ba8g2ajri.jpg",
  "https://res.cloudinary.com/dyleaesxc/image/upload/v1692800272/production/q9gwkrvvld5ztdae5d5vnjwkel8d.jpg"
]

photo_brice = URI.open("https://res.cloudinary.com/dyleaesxc/image/upload/v1692953861/affiche-promotionnelle-de-brice-de-nice-2005_portrait_w674_ho2ci0.jpg")
photo_kelly = URI.open("https://res.cloudinary.com/dyleaesxc/image/upload/v1692954126/jhegfsrg_i32krr.png")
photo_pablo = URI.open("https://res.cloudinary.com/dyleaesxc/image/upload/v1692953861/d412c_fwbota.jpg")

puts "creation db seed ongoing"

brice = User.new(first_name: 'Brice', last_name: 'DeNice', location: 'Boulevard De La Dune, 40150 Soorts-Hossegor, France', phone_number: '06 06 06 06 06', email: 'brice@toto.com', password: 'azeaze')
pablo = User.new(first_name: 'Pablo', last_name: 'Dishaka', location: 'Allée Wiston Churchill, Biarritz, Pyrénées-Atlantiques, France', phone_number: '07 07 07 07 07', email: 'pablo@toto.com', password: 'azeaze')
kelly = User.new(first_name: 'Kelly', last_name: 'Slater', location: 'Boulevard de la Plage, Lacanau, Gironde, France', phone_number: '06 07 06 07 06', email: 'kelly@toto.com', password: 'azeaze')

puts "creation 3 users done"

longboard = Board.new(name: "Beginner's Soft-Top Longboard", board_type: "longboard", description: "A stable and forgiving soft-top longboard, perfect for beginners learning to catch their first waves.", price: 20)
longboard2 = Board.new(name: "Longboard beautiful 900 9'4", board_type: "longboard", description: "A stable and forgiving soft-top longboard, perfect for beginners learning to catch their first waves.", price: 22)
shortboard = Board.new(name: "Performance Shortboard", board_type: "shortboard", description: "A versatile fish hybrid surfboard, great for riders who want speed and maneuverability in all conditions.", price: 35)
fish = Board.new(name: "Fish Hybrid Surfboard", board_type: "fish", description: "A versatile fish hybrid surfboard, great for riders who want speed and maneuverability in all conditions.", price: 32)

brice.photo.attach(io: photo_brice, filename: "nes.png", content_type: "image/png")
kelly.photo.attach(io: photo_kelly, filename: "nes.png", content_type: "image/png")
pablo.photo.attach(io: photo_pablo, filename: "nes.png", content_type: "image/png")

photos_long.each do |url|
  file = URI.open(url)
  longboard.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end
brice.save
longboard.user = brice
longboard.save

photos_short.each do |url|
  file = URI.open(url)
  shortboard.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end
kelly.save
shortboard.user = kelly
shortboard.save

photos_fish.each do |url|
  file = URI.open(url)
  fish.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end
pablo.save
fish.user = pablo
fish.save

photos_long2.each do |url|
  file = URI.open(url)
  longboard2.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end
pablo.save
longboard2.user = pablo
longboard2.save

puts "creation 3 boards done"

book = Booking.new(date_start: "2023-07-02", date_end: "2023-07-09")
book.board = longboard
book.user = kelly
book.save

review = Review.new(comment: "super session, je recommande !", rating: "5")
review.board = longboard
review.save

book = Booking.new(date_start: "2023-07-02", date_end: "2023-07-09")
book.board = shortboard
book.user = kelly
book.save

review = Review.new(comment: "très bonnes journées passées avec cette planche", rating: "5")
review.board = shortboard
review.save

book = Booking.new(date_start: "2023-08-02", date_end: "2023-08-09")
book.board = fish
book.user = kelly
book.save

review = Review.new(comment: "Me revoilà toujours aussi content", rating: "5")
review.board = fish
review.save

book = Booking.new(date_start: "2023-07-02", date_end: "2023-07-09")
book.board = fish
book.user = kelly
book.save

review = Review.new(comment: "super planche, merci Pablo je reviendrai", rating: "5")
review.board = fish
review.save

book = Booking.new(date_start: "2023-08-02", date_end: "2023-08-09")
book.board = longboard
book.user = pablo
book.save

review = Review.new(comment: "Ca aurait pu etre mieux mais je suis tout de même satisfait", rating: "4")
review.board = longboard
review.save

puts "booking creation done"
