require "json"
require 'open-uri'

class TmdbSuggestionsController < ApplicationController
  def fetcher
    query = create_query_object

    # calls method to generate the first api url, by passing the query attributes and the page number
    api_url = prepare_api_url(
      query.positive_actors_tmdb_ids,
      query.positive_genres_tmdb_ids,
      query.negative_genres_tmdb_ids,
      1
    )


    first_results = perform_api_call(api_url)
    unless first_results.nil?
      number_of_results = first_results['total_results']

      # every api page cointains 20 results (if there are 20 left from the previous pages)
      number_of_pages = first_results['total_pages']
    end
    raise
  end





  private

  #1
  def create_query_object
    # creates query object by passing arrays of tmbd_ids

    user = current_user ? current_user : User.first # prevents breaking if user is not logged in
    query = Query.create(
      user: user,
      positive_actors_tmdb_ids: get_actors_positive.pluck(:tmdb_id), # these are all defined as array attributes in the schema
      negative_actors_tmdb_ids: get_actors_negative.pluck(:tmdb_id),
      positive_directors_tmdb_ids: get_directors_positive.pluck(:tmbd_id),
      negative_directors_tmdb_ids: get_directors_negative.pluck(:tmbd_id),
      positive_genres_tmdb_ids: get_genres_positive.pluck(:tmdb_id),
      negative_genres_tmdb_ids: get_genres_negative.pluck(:tmdb_id)
    )
    return query
  end

  #2
  def prepare_api_url(actors_positive, genres_positive, genres_negative, page)
    # multiples ids divided by: %2C
    # &with_crew=#{directors_ids} --> search for crew, but gives results where the director could be writer/producer, so a generic member of the crew

    actor_ids = prepare_params_for_api(actors_positive).join
    genres_p_ids = prepare_params_for_api(genres_positive).join
    genres_n_ids = prepare_params_for_api(genres_negative).join
    discover_url = "https://api.themoviedb.org/3/discover/movie?api_key=81c398dbb6b994e4f815e69325c4893c&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=true&page=#{page}&with_cast=#{actor_ids}&with_genres=#{genres_p_ids}&without_genres=#{genres_n_ids}"
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




  # below are all the methods to retrieve objects from OUR DB given the strings the user passed as filters

  def get_actors_positive
    # we take the params and convert them to an array of strings
    @actors_positive = params[:actors_positive].split(',')
    # we iterate through the array to query the local database and return an array of objects
    @positive_actor_query = []
    @actors_positive.each do |actor|
      @positive_actor_query << Actor.find_by(name: "#{actor}")
    end
    return @positive_actor_query
  end

  def get_actors_negative
    @actors_negative = params[:actors_negative].split(',')

    @negative_actor_query = []
    @actors_negative.each do |actor|
      @negative_actor_query  << Actor.find_by(name: "#{actor}")
    end
    return @negative_actor_query
  end

  def get_directors_positive
    @directors_positive = params[:directors_positive].split(',')

    @positive_director_query = []
    @directors_positive.each do |director|
      @positive_director_query << Director.find_by(name: "#{director}")
    end
    return @positive_director_query
  end

  def get_directors_negative
    @directors_negative = params[:directors_negative].split(',')

    @negative_director_query = []
    @directors_negative.each do |director|
      @negative_director_query << Director.find_by(name: "#{director}")
    end
    return @negative_director_query
  end

  def get_genres_positive
    @genres_positive = params[:genres_positive].split(',')

    @positive_genre_query = []
    @genres_positive.each do |genre|
      @positive_genre_query << Genre.find_by(name: "#{genre}")
    end
    return @positive_genre_query
  end

  def get_genres_negative
    @genres_negative = params[:genres_negative].split(',')

    @negative_genre_query = []
    @genres_negative.each do |genre|
      @negative_genre_query << Genre.find_by(name: "#{genre}")
    end
    return @negative_genre_query
  end

end



























