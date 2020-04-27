require "json"
require 'open-uri'

# movies with popularity higher than 2.0 are roughly 70k
# for 50 movies --> 30260.81ms
# second attempt --> 18023.91ms
# for 20 movies --> 13309.59ms
# second attempt --> 14492.98ms

# First Heroku attempt for 20 movies --> 15099.01ms
# Second Heroku attempt for 20 movies --> 14850.64ms


class DownloadMovieJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # MOVIES GENERATOR ############################################################################################
    director = Director.create(name: 'placeholder')
    counter = 0

    File.foreach("./db/tmdb_ids/movie_ids_04_19_2020.json").map do |line|
      parsed_line = JSON.parse(line)
      next if parsed_line['popularity'] <= 2.0

      id = parsed_line["id"]
      next if !Movie.find_by(tmdb_id: id).nil?

      counter += 1
      break if counter > 10000

      begin
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
          actors_counter = 0
          movie_credits['cast'].each do |cast_member|
            actors_counter += 1
            break if actors_counter > 15
            # creates actor only if there isn't already an actor in our DB with the same tmbd_id, to avoid clones
            if Actor.find_by(tmdb_id: cast_member['id']).nil?
              Actor.create(
                name: cast_member['name'],
                tmdb_id: cast_member['id'],
                photo_url: cast_member['profile_path']
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

  end
end





# way to count movies based on popularity
# counter = 0
# sum = 0
# File.foreach("./db/tmdb_ids/movie_ids_04_19_2020.json").map do |line|
#   next if JSON.parse(line)['popularity'] <= 2.0
#   counter += 1
#   sum += JSON.parse(line)['popularity']

# end

# p sum / counter
# p counter
