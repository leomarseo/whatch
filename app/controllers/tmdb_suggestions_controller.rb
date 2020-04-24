class TmdbSuggestionsController < ApplicationController
  def get_actors
    @actors_positive = params[:actors_positive].split(',')

    @positive_actor_query = []
    @actors_positive.each do |actor|
      @positive_actor_query << Actor.find_by(name: "#{actor}")
    end
    @actors_negative = params[:actors_negative].split(',')

    @negative_actor_query = []
    @actors_negative.each do |actor|
      @negative_actor_query  << Actor.find_by(name: "#{actor}")
    end
    get_directors
    get_genres
  end

  def get_directors
    @directors_positive = params[:directors_positive].split(',')

    @positive_director_query = []
    @directors_positive.each do |director|
      @positive_director_query << Director.find_by(name: "#{director}")
    end


    @directors_negative = params[:directors_negative].split(',')

    @negative_director_query = []
    @directors_negative.each do |director|
      @negative_director_query << Director.find_by(name: "#{director}")
    end
  end

  def get_genres
    @genres_positive = params[:genres_positive].split(',')

    @positive_genre_query = []
    @genres_positive.each do |genre|
      @positive_genre_query << Genre.find_by(name: "#{genre}")
    end
    @genres_negative = params[:genres_negative].split(',')

    @negative_genre_query = []
    @genres_negative.each do |genre|
      @negative_genre_query << Genre.find_by(name: "#{genre}")
    end
  end

end
# need to create one method that calls the other three
