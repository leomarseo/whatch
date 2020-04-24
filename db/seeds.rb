require "json"
require 'open-uri'

# GENRES GENERATOR ############################################################################################
# takes from the local file 'db/tbdb_ids/genres.json' which is the result of the API request to TMDB for genres
url = open("./db/tmdb_ids/genres.json").read
data = JSON.parse(url)
data['genres'].each do |genre|
  Genre.create(name: genre['name'], tmdb_id: genre['id'])
end
# /GENRES GENERATOR ############################################################################################

director = Director.create(name: 'placeholder') # creates placeholder director to avoid validation issues during movie creation

# MOVIES GENERATOR ############################################################################################
File.foreach("./db/tmdb_ids/test.json").map do |line|
  begin
    id = JSON.parse(line)["id"]
    url_details = open("https://api.themoviedb.org/3/movie/#{id}?api_key=81c398dbb6b994e4f815e69325c4893c&language=en-US").read
  rescue OpenURI::HTTPError
    next # skips the whole creation process if url is not found
  else
    movie_details = JSON.parse(url_details)

    # creates movie by extracting information from API response
    Movie.create(
      tmdb_id: id,
      title: movie_details['title'],
      original_title: movie_details['original_title'],
      runtime: movie_details['runtime'],
      overview: movie_details['overview'],
      photo_url: movie_details['poster_path'],
      release_date: movie_details['release_date'],
      vote_average: movie_details['vote_average'],
      vote_count: movie_details['vote_count'],
      tagline: movie_details['tagline'],
      belongs_to_collection: movie_details['belongs_to_collection'],
      director: director
    )

    movie_details['genres'].each do |genre|
      # creates association between genres and movies for each genre present in API response to movie details
      JointGenre.create(
        genre: Genre.find_by(tmdb_id: genre['id']),
        movie: Movie.find_by(tmdb_id: id)
        )
    end

    begin
      url_credits = open("https://api.themoviedb.org/3/movie/#{id}/credits?api_key=81c398dbb6b994e4f815e69325c4893c").read
    rescue OpenURI::HTTPError
      next
    else
      movie_credits = JSON.parse(url_credits)

      # DIRECTORS GENERATOR #################################################################################
      movie_credits['crew'].each do |crew_member|
        next if crew_member['job'] != 'Director'

        # creates director by searching the API response to Movie-credits
        if Director.find_by(tmdb_id: crew_member['id']).nil?
          Director.create(
            name: crew_member['name'],
            tmdb_id: crew_member['id'],
            photo_url: crew_member['profile_path']
            )
        end

        # assigns newly created director to previously created movie, replacing placeholder
        Movie.find_by(tmdb_id: id).update(director: Director.find_by(tmdb_id: crew_member['id']))
      end
      # /DIRECTORS GENERATOR #################################################################################


      # ACTORS GENERATOR #################################################################################
      movie_credits['cast'].each do |cast_member|

        # creates actor only if there isn't already an actor in our DB with the same tmbd_id, to avoid clones
        if Actor.find_by(tmdb_id: cast_member['id']).nil?
          Actor.create(
            name: cast_member['name'],
            tmdb_id: cast_member['id']
          )
        end

        # creates association between actors and movies for each actor present in API response to movie credits
        StarringActor.create(
          movie: Movie.find_by(tmdb_id: id),
          actor: Actor.find_by(tmdb_id: cast_member['id']),
          character: cast_member['character'],
          photo_url: cast_member['profile_path']
        )

      end
      # /ACTORS GENERATOR #################################################################################

    end
  end
end
# /MOVIES GENERATOR ############################################################################################

User.create(email: 'user1@example.com', password: '123456', first_name: 'Marco', last_name: 'Rossi', age: 29, country: 'Italy')
User.create(email: 'user2@example.com', password: '123456', first_name: 'John', last_name: 'Dalton', age: 40, country: 'Belgium')
User.create(email: 'admin@example.com', password: '123456', first_name: 'Admin', last_name: 'Admin', age: 20, country: 'Italy', admin: true)

Award.create(award_type: 'Oscar', category: 'Best Actor', year: '2000', movie_id: 1, awardable_id: 1, awardable_type: 'Actor')
Award.create(award_type: 'Oscar', category: 'Best Directing', year: '2000', movie_id: 1, awardable_id: 1, awardable_type: 'Director')
Award.create(award_type: 'Golden Globe', category: 'Best Director', year: '2010', movie_id: 2, awardable_id: 2, awardable_type: 'Director')

Service.create(company: 'Netflix', country: 'Italy')
Service.create(company: 'Amazon', country: 'Italy')
Service.create(company: 'Netflix', country: 'Germany')

AvailableService.create(service_id: 1, movie_id: 1)
AvailableService.create(service_id: 2, movie_id: 2)
AvailableService.create(service_id: 3, movie_id: 1)

SavedMovie.create(movie_id: 1, user_id: 1, seen: true, user_rating: 1)
SavedMovie.create(movie_id: 1, user_id: 2, seen: false, user_rating: 0)
SavedMovie.create(movie_id: 2, user_id: 2, seen: false)


JointAchievement.create(user_id: 1, saved_movie_id: 2, achievement_id: 1, earned: true)
JointAchievement.create(user_id: 2, saved_movie_id: 2, achievement_id: 2, earned: true)
JointAchievement.create(user_id: 2, saved_movie_id: 2, achievement_id: 3, earned: true)
JointAchievement.create(user_id: 2, saved_movie_id: 2, achievement_id: 4, earned: true)


Achievement.create(name: "Beginner", description: "You saw 1 movie")
Achievement.create(name: "Archeologist", description: "You made 100 research")
Achievement.create(name: "Fetishist", description: "You saw 300 movies with low rating")
Achievement.create(name: "May the force be with you", description: "You saw all the Star Wars saga")
Achievement.create(name: "Yah", description: "You saw 10 Western movies")



# creates fake suggestion as we would receive it from the API request. For now it contains 3 suggestions, we might receive way more than this
TmdbSuggestion.create(user: User.first, tmdb_movie_id_list: '5 6 7')

# for each of the ids received in the TmdbSuggestion, we loop to create a Suggestion that contains OUR movie_id by looking for the correct movie through tmdb_id
movie_id_array = TmdbSuggestion.last.tmdb_movie_id_list.split(' ')
movie_id_array.each do |tmdb_movie_id|
  Suggestion.create(movie: Movie.find_by(tmdb_id: tmdb_movie_id), tmdb_suggestion: TmdbSuggestion.last)
end





