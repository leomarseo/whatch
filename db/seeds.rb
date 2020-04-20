# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'user1@example.com', password: '123456', first_name: 'Marco', last_name: 'Rossi', age: 29, country: 'Italy')
User.create(email: 'user2@example.com', password: '123456', first_name: 'John', last_name: 'Dalton', age: 40, country: 'Belgium')

Actor.create(name: 'Example Actor 1', age: '40', photo_url: 'https://image.tmdb.org/t/p/w500/fk8OfdReNltKZqOk2TZgkofCUFq.jpg')
Actor.create(name: 'Example Actor 2', age: '50', photo_url: 'https://image.tmdb.org/t/p/w500/kU3B75TyRiCgE270EyZnHjfivoq.jpg')

Director.create(name: 'Example Director 1', photo_url: 'https://upload.wikimedia.org/wikipedia/commons/9/95/Christopher_Nolan_Cannes_2018.jpg')
Director.create(name: 'Example Director 2', photo_url: "https://upload.wikimedia.org/wikipedia/commons/2/29/Steven_Spielberg_Masterclass_Cin%C3%A9math%C3%A8que_Fran%C3%A7aise_2_cropped.jpg")

Genre.create(name: 'Example Genre 1')
Genre.create(name: 'Example Genre 2')

Movie.create(director_id: 1, title: 'Example Title 1', year: '2000', runtime: '120', overview: "example overview of this example movie 1 it's very nice but also very bad", photo_url: 'https://image.tmdb.org/t/p/w500/8kSerJrhrJWKLk1LViesGcnrUPE.jpg')
Movie.create(director_id: 2, title: 'Example Title 2', year: '2010', runtime: '140', overview: "example overview of this example movie 2 it's very nice but also very bad", photo_url: 'https://image.tmdb.org/t/p/w500/8kSerJrhrJWKLk1LViesGcnrUPE.jpg')

JointGenre.create(movie_id: 1, genre_id: 1)
JointGenre.create(movie_id: 1, genre_id: 2)
JointGenre.create(movie_id: 2, genre_id: 2)

SeenMovie.create(movie_id: 1, user_id: 1, user_rating: 1)
SeenMovie.create(movie_id: 2, user_id: 1, user_rating: 0)
SeenMovie.create(movie_id: 2, user_id: 2, user_rating: 1)

StarringActor.create(movie_id: 1, actor_id: 1, character: 'Example Character 1')
StarringActor.create(movie_id: 1, actor_id: 2, character: 'Example Character 2')
StarringActor.create(movie_id: 2, actor_id: 2, character: 'Example Character 3')

Award.create(award_type: 'Oscar', category: 'Best Actor', year: '2000', movie_id: 1, awardable_id: 1, awardable_type: 'Actor')
Award.create(award_type: 'Oscar', category: 'Best Directing', year: '2000', movie_id: 1, awardable_id: 1, awardable_type: 'Director')
Award.create(award_type: 'Golden Globe', category: 'Best Director', year: '2010', movie_id: 2, awardable_id: 2, awardable_type: 'Director')

Service.create(company: 'Netflix', country: 'Italy')
Service.create(company: 'Amazon', country: 'Italy')
Service.create(company: 'Netflix', country: 'Germany')

AvailableService.create(service_id: 1, movie_id: 1)
AvailableService.create(service_id: 2, movie_id: 2)
AvailableService.create(service_id: 3, movie_id: 1)
