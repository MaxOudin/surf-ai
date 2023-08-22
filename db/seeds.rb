# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Board.destroy_all

puts "creation db seed ongoing"

john = User.create!(first_name: 'John', last_name: 'Doe', location: 'Hossegor', email: 'toto@toto.com', password: 'P@ssw0rd123!')
jane = User.create!(first_name: 'Jane', last_name: 'Smith', location: 'Lacanau', email: 'tota@toto.com', password: 'P@ssw0rd124!')
michael = User.create!(first_name: 'Michael', last_name: 'Johnson', location: 'Biarritz', email: 'tato@toto.com', password: 'P@ssw0rd126!')

puts "creation 3 users done"

longboard = Board.new(name: "Beginner's Soft-Top Longboard", board_type: "longboard", description: "A stable and forgiving soft-top longboard, perfect for beginners learning to catch their first waves.", price: 20)
shortboard = Board.new(name: "Performance Shortboard", board_type: "shortboard", description: "A versatile fish hybrid surfboard, great for riders who want speed and maneuverability in all conditions.", price: 35)
fish = Board.new(name: "Fish Hybrid Surfboard", board_type: "fish", description: "A versatile fish hybrid surfboard, great for riders who want speed and maneuverability in all conditions.", price: 32)

puts "creation 3 boards done"

longboard.user = john
shortboard.user = jane
fish.user = michael

longboard.save
shortboard.save
fish.save

puts "boards associated"
