class DownloadSingleMovieJob < ApplicationJob
  queue_as :default

  def perform(id)
    # Do something later
    begin
      url_details = open("https://api.themoviedb.org/3/movie/#{id}?api_key=81c398dbb6b994e4f815e69325c4893c&language=en-US").read
    rescue OpenURI::HTTPError
      return # skips the whole creation process if url is not found

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
        director: Director.first
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
        return

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
              tmdb_id: cast_member['id'],
              popularity: 0.0
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
