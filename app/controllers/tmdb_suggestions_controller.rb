require "json"
require 'open-uri'

# amount of filters will be limited to:
  # 2 actors positive,
  # 2 actors negative,
  # 1 director (either positive or negative)
  # 2 genres positive,
  # 2 genres negative


class TmdbSuggestionsController < ApplicationController
  def fetcher
    parsed_params = JSON.parse(params['params'])
    query = create_query_object(parsed_params)
    all_suggestions = [] # here we'll store all results from different api calls

    # calls method to generate the first api url, by passing the query attributes
    first_api_url = prepare_api_url(
      query.positive_actors_tmdb_ids,
      query.positive_genres_tmdb_ids,
      query.negative_genres_tmdb_ids,
      query.positive_directors_tmdb_ids
    )

    # FIRST ROUND OF API CALL
    # calls chain of methods ducumented below to ultimately retrieve a list of movies already filtered using all filters (also negative ones)
    first_response = perform_api_call(first_api_url)
    first_suggestions = retrieve_objects_from_response(first_response)

    # this will collect all suggestions from different pages of the first API response
    intermediate_suggestions_collector = first_suggestions

    # this if statement allows us to retrieve results also from other pages of the same api response, so that we have a wider range of suggestions
    # from which we'll apply our own DB filters (director and negative actors)
    if first_response['total_pages'] > 1
      counter = 1
      first_response['total_pages'].times do
        counter += 1
        break if counter > 6

        api_url = prepare_api_url(
          query.positive_actors_tmdb_ids,
          query.positive_genres_tmdb_ids,
          query.negative_genres_tmdb_ids,
          query.positive_directors_tmdb_ids,
          counter
        )

        intermediate_suggestions_collector << retrieve_suggestions(api_url)
      end
    end

    first_suggestions_filtered = filter_with_our_db(
      intermediate_suggestions_collector.flatten,
      query.positive_actors_tmdb_ids,
      query.negative_actors_tmdb_ids,
      query.positive_directors_tmdb_ids,
      query.negative_directors_tmdb_ids
    )

    all_suggestions.push(first_suggestions_filtered).flatten!

    # variables that are going to be used later to perform backup api calls##############
    first_p_actor = []
    first_p_actor << query.positive_actors_tmdb_ids.first # this is done because the prepare_api_url requires arrays
    second_p_actor = []
    second_p_actor << query.positive_actors_tmdb_ids.second
    first_n_genre = []
    first_n_genre << query.negative_genres_tmdb_ids.first
    second_n_genre = []
    second_n_genre << query.negative_genres_tmdb_ids.second

    created = false
    #####################################################################################


    if all_suggestions.count >= 10 && !created
      create_tmdb_suggestion_object_and_suggestions(query, all_suggestions)
      created = true
    elsif query.positive_actors_tmdb_ids.count >= 2
      # if suggestions are not enough (i.e. < 10) we restart the process to collect more, but passing one less positive actor


      # SECOND API CALL, P-ACTOR-1 + ALL OTHER FILTERS
      second_api_url = prepare_api_url(
        first_p_actor,
        query.positive_genres_tmdb_ids,
        query.negative_genres_tmdb_ids,
        query.positive_directors_tmdb_ids
      )

      second_suggestions_filtered = filter_with_our_db(
        retrieve_suggestions(second_api_url),
        query.positive_actors_tmdb_ids,
        query.negative_actors_tmdb_ids,
        query.positive_directors_tmdb_ids,
        query.negative_directors_tmdb_ids
      )

      all_suggestions.push(second_suggestions_filtered).flatten!.uniq!



      # THIRD API CALL, P-ACTOR-2 + ALL OTHER FILTERS
      third_api_url = prepare_api_url(
        second_p_actor,
        query.positive_genres_tmdb_ids,
        query.negative_genres_tmdb_ids,
        query.positive_directors_tmdb_ids
      )

      third_suggestions_filtered = filter_with_our_db(
        retrieve_suggestions(third_api_url),
        query.positive_actors_tmdb_ids,
        query.negative_actors_tmdb_ids,
        query.positive_directors_tmdb_ids,
        query.negative_directors_tmdb_ids
      )

      all_suggestions.push(third_suggestions_filtered).flatten!.uniq!


      # FOURTH API CALL, BOTH P-ACTORS + ALL OTHER FILTERS EXCEPT FOR GENRE
      fourth_api_url = prepare_api_url(
        query.positive_actors_tmdb_ids,
        [],
        [],
        query.positive_directors_tmdb_ids
      )

      fourth_suggestions_filtered = filter_with_our_db(
        retrieve_suggestions(fourth_api_url),
        query.positive_actors_tmdb_ids,
        query.negative_actors_tmdb_ids,
        query.positive_directors_tmdb_ids,
        query.negative_directors_tmdb_ids
      )

      all_suggestions.push(fourth_suggestions_filtered).flatten!.uniq!
    end

    # so far we checked if user had 2 positive actor filters, and if so we run the second and third to retrieve movies with
    # actor 1 + all genres filters OR actor 2 + all genres filters. This should be enough to achieve 10 movies, but still we'll have
    # backup calls just in case we still don't reach 10

    if all_suggestions.count >= 10 && !created
      create_tmdb_suggestion_object_and_suggestions(query, all_suggestions)
      created = true
    elsif query.negative_genres_tmdb_ids.count >= 2

      # FIFTH API CALL, P-ACTOR-1 + N-GENRE-1 + N-DIRECTOR
      fifth_api_url = prepare_api_url(
        first_p_actor,
        [],
        first_n_genre,
        []
      )

      fifth_suggestions_filtered = filter_with_our_db(
        retrieve_suggestions(fifth_api_url),
        query.positive_actors_tmdb_ids,
        query.negative_actors_tmdb_ids,
        [],
        query.negative_directors_tmdb_ids
      )

      all_suggestions.push(fifth_suggestions_filtered).flatten!.uniq!

      # SIXTH API CALL, P-ACTOR-1 + N-GENRE-2 + N-DIRECTOR
      sixth_api_url = prepare_api_url(
        first_p_actor,
        [],
        second_n_genre,
        []
      )

      sixth_suggestions_filtered = filter_with_our_db(
        retrieve_suggestions(sixth_api_url),
        query.positive_actors_tmdb_ids,
        query.negative_actors_tmdb_ids,
        [],
        query.negative_directors_tmdb_ids
      )

      all_suggestions.push(sixth_suggestions_filtered).flatten!.uniq!

    else

      # FIFTH API CALL (executed only if 4 and 5 are not), P-ACTOR-1 + N-GENRE-1 + N-DIRECTOR

      fifth_api_url = prepare_api_url(
        first_p_actor,
        [],
        first_n_genre,
        []
      )

      fifth_suggestions_filtered = filter_with_our_db(
        retrieve_suggestions(fifth_api_url),
        query.positive_actors_tmdb_ids,
        query.negative_actors_tmdb_ids,
        [],
        query.negative_directors_tmdb_ids
      )

      all_suggestions.push(fifth_suggestions_filtered).flatten!.uniq!
    end

    # FINAL CHECK, IF IT'S STILL NOT 10 SUGGESTIONS, WE RUN THE MOST BASIC CALL: JUST P-ACTOR-1
    if all_suggestions.count >= 10 && !created
      create_tmdb_suggestion_object_and_suggestions(query, all_suggestions)
      created = true
    else

      final_api_url = prepare_api_url(
        first_p_actor,
        [],
        [],
        []
      )

      final_suggestions_filtered = filter_with_our_db(
        retrieve_suggestions(final_api_url),
        [],
        [],
        [],
        []
      )


      all_suggestions.push(final_suggestions_filtered).flatten!.uniq!

      create_tmdb_suggestion_object_and_suggestions(query, all_suggestions)
    end

    redirect_to results_path
  end





  private

  def create_tmdb_suggestion_object_and_suggestions(query, suggestions)
    user = current_user ? current_user : User.first

    # creates tmdb_suggestion object with reference to the query
    tmdb_suggestion = TmdbSuggestion.create(
      user: user,
      tmdb_movie_id_list: suggestions.pluck(:tmdb_id).join(' '),
      query: query,
    )

    # creates suggestions with reference to the tmdb_suggestion
    suggestions.each do |movie|
      Suggestion.create(
        movie: movie,
        tmdb_suggestion: tmdb_suggestion
        )
    end
  end

  def retrieve_suggestions(api_url)
    # method that chains tasks 2, 3 and 4
    response = perform_api_call(api_url)
    retrieve_objects_from_response(response)
  end

  #1
  def create_query_object(parsed_params)
    # creates query object by passing arrays of tmdb_ids

    user = current_user ? current_user : User.first # prevents breaking if user is not logged in
    query = Query.create(
      user: user,
      positive_actors_tmdb_ids: get_actors_positive(parsed_params).pluck(:tmdb_id), # these are all defined as array attributes in the schema
      negative_actors_tmdb_ids: get_actors_negative(parsed_params).pluck(:tmdb_id),
      positive_directors_tmdb_ids: get_directors_positive(parsed_params).pluck(:tmdb_id),
      negative_directors_tmdb_ids: get_directors_negative(parsed_params).pluck(:tmdb_id),
      positive_genres_tmdb_ids: get_genres_positive(parsed_params).pluck(:tmdb_id),
      negative_genres_tmdb_ids: get_genres_negative(parsed_params).pluck(:tmdb_id)
    )
    return query
  end

  #2
  def prepare_api_url(actors_positive, genres_positive, genres_negative, directors_positive, page = 1)
    # multiples ids divided by: %2C
    # &with_crew=#{directors_ids} --> search for crew, but gives results where the director could be writer/producer, so a generic member of the crew

    actor_ids = prepare_params_for_api(actors_positive).join
    genres_p_ids = prepare_params_for_api(genres_positive).join
    genres_n_ids = prepare_params_for_api(genres_negative).join
    directors_ids = prepare_params_for_api(directors_positive).join
    discover_url = "https://api.themoviedb.org/3/discover/movie?api_key=81c398dbb6b994e4f815e69325c4893c&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=true&page=#{page}&with_cast=#{actor_ids}&with_crew=#{directors_ids}&with_genres=#{genres_p_ids}&without_genres=#{genres_n_ids}"
    return discover_url
  end

  #3
  def prepare_params_for_api(array_of_ids)
    # prepares tmdb_ids to be psased in the API call. The first one is passed as a simple number, the following ones are interpolated with the necessary %2C

    refined_ids_array = []
    array_of_ids.each do |id|
      if array_of_ids.index(id) == 0
        refined_ids_array << id
      else
       refined_ids_array << "%2C#{id}"
      end
    end
    return refined_ids_array
  end

  #4
  def perform_api_call(api_url)
    # performs api call if provided with functioning url

    begin
      results_of_api_call = open(api_url).read
    rescue OpenURI::HTTPError
      results = nil
    else
      results = JSON.parse(results_of_api_call)
    end
    return results
  end

  #5
  def retrieve_objects_from_response(response)
    # searches in our DB for the first ids, if doesn't find one, it performs an API call to retrieve and store that movie's info

    suggestions_ids_collector = []
    unless response.nil?
      response['results'].each do |result|
        suggestions_ids_collector << result['id']
      end
    end

    suggestions_objects_collector = []
    suggestions_ids_collector.each do |id|
      movie = Movie.find_by(tmdb_id: id)
      if movie
        suggestions_objects_collector << movie
      else
        # perform retrieve movie task and push it into the suggestions_objects_collector
        DownloadSingleMovieJob.perform_now(id)
        suggestions_objects_collector << Movie.find_by(tmdb_id: id) if Movie.find_by(tmdb_id: id)
      end
    end

    return suggestions_objects_collector
  end

  #6
  def filter_with_our_db(suggestions, pos_act, neg_act, pos_dir, neg_dir)
    # loops through all suggestions to check if there's movies to be filtered out

    to_be_removed = []
    suggestions.each do |movie|

      # loops through positive actors
      unless pos_act.nil?
        pos_act.each do |actor_tmdb_id|
          to_be_removed << suggestions.index(movie) if movie.actors.pluck(:tmdb_id).first(15).exclude? actor_tmdb_id.to_i
        end
      end

      # loops through negative actors
      unless neg_act.nil?
        neg_act.each do |actor_tmdb_id|
          to_be_removed << suggestions.index(movie) if movie.actors.pluck(:tmdb_id).first(15).include? actor_tmdb_id.to_i
        end
      end

      # loops through directors (will be limited to one, but you never know if we'll increase the number)
      unless pos_dir.nil?
        pos_dir.each do |director_tmdb_id|
          to_be_removed << suggestions.index(movie) if movie.director.tmdb_id != director_tmdb_id.to_i
        end
      end

      unless neg_dir.nil?
        neg_dir.each do |director_tmdb_id|
          to_be_removed << suggestions.index(movie) if movie.director.tmdb_id == director_tmdb_id.to_i
        end
      end
    end

    # performs the deletion all at the end to prevent loops from breaking
    partial_suggestions = suggestions.delete_if.with_index { |_, index| to_be_removed.include? index }

    # finally filters out movies already seen
    final_suggestions = filter_by_already_seen(partial_suggestions)

    return final_suggestions
  end

  #7
  def filter_by_already_seen(suggestions)
    # loops through all suggestions to check if there's movies that were already seen by the current user
    user = (current_user ? current_user : User.first)
    to_be_removed = user.saved_movies.pluck(:movie_id)


    partial_suggestions = suggestions.filter { |suggestion| to_be_removed.exclude?(suggestion.id) }

    final_suggesions = filter_by_banned(partial_suggestions)

    return final_suggestions
  end

  #8
  def filter_by_banned(suggestions)
    # this method exists to allow us to manually exclude movies from suggestions at will

    banned = [8443] # put here all movie_ids of movies which have any kind of problem (e.g. this one is a duplicate coming from tmdb directly)

    final_suggestions = suggestions.filter { |suggestion| banned.exclude?(suggestion.id) }

    return final_suggestions
  end




  # below are all the methods to retrieve objects from OUR DB given the strings the user passed as filters

  def get_actors_positive(parsed_params)
    # we iterate through the array to query the local database and return an array of objects
    @positive_actor_query = []
    parsed_params['positive_actors'].each do |actor|
      actor_object = Actor.find_by(name: actor.join)
      @positive_actor_query << actor_object if actor_object
    end
    return @positive_actor_query
  end

  def get_actors_negative(parsed_params)
    @negative_actor_query = []
    parsed_params['negative_actors'].each do |actor|
      actor_object = Actor.find_by(name: actor.join)
      @negative_actor_query  << actor_object if actor_object
    end
    return @negative_actor_query
  end

  def get_directors_positive(parsed_params)
    @positive_director_query = []
    parsed_params['positive_directors'].each do |director|
      director_object = Director.find_by(name: director.join)
      @positive_director_query << director_object if director_object
    end
    return @positive_director_query
  end

  def get_directors_negative(parsed_params)
    @negative_director_query = []
    parsed_params['negative_directors'].each do |director|
      director_object = Director.find_by(name: director.join)
      @negative_director_query << director_object if director_object
    end
    return @negative_director_query
  end

  def get_genres_positive(parsed_params)
    @positive_genre_query = []
    parsed_params['positive_genres'].each do |genre|
      genre_object = Genre.find_by(name: genre.join)
      @positive_genre_query << genre_object if genre_object
    end
    return @positive_genre_query
  end

  def get_genres_negative(parsed_params)
    @negative_genre_query = []
    parsed_params['negative_genres'].each do |genre|
      genre_object = Genre.find_by(name: genre.join)
      @negative_genre_query << genre_object if genre_object
    end
    return @negative_genre_query
  end

end



























