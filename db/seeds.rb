# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
test_guy = User.new
test_guy.name = "Bob"
test_guy.password = "lolhax"
test_guy.email = "lol@lol.com"
test_guy.save 
