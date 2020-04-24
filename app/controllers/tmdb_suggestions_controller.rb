class TmdbSuggestionsController < ApplicationController
# the fetcher collects all objects from all methods below
  def fetcher
    @actors_positive = get_actors_positive
    @actors_negative = get_actors_negative
    @directors_positive = get_directors_positive
    @directors_negative = get_directors_negative
    @genres_positive = get_genres_positive
    @genres_negative = get_genres_negative
  end

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
# need to create one method that calls the other three
