# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'user1@example.com', password: '123456', first_name: 'Marco', last_name: 'Rossi', age: 29, country: 'Italy')
User.create(email: 'user2@example.com', password: '123456', first_name: 'John', last_name: 'Dalton', age: 40, country: 'Belgium')

