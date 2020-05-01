class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home2]

  def home
    # actors = Actor.order(popularity: :desc).pluck(:name, :photo_url) # order seems to break on heroku
    actors = Actor.order(popularity: :desc).pluck(:name, :photo_url)
    @actors_names = []
    @actors_photos = []
    actors.each do |actor|
      @actors_names << actor.first
      if actor.last.nil?
        @actors_photos << 'placeholder'
      else
        @actors_photos << actor.last
      end
    end

    directors = Director.order(popularity: :desc).pluck(:name, :photo_url)
    @directors_names = []
    @directors_photos = []
    directors.each do |director|
      @directors_names << director.first
      if director.last.nil?
        @directors_photos << 'placeholder'
      else
        @directors_photos << director.last
      end
    end

    genres = Genre.order(name: :asc).pluck(:name)
    @genres_names = []
    @genres_photos = []
    genres.each do |genre|
      @genres_names << genre
      @genres_photos << 'genre_placeholder'
    end
  end

  def landing
  end

  def profile
  end

  def confirmation
    @movie = Movie.find(params[:movie_id])
    saved_movie = current_user.saved_movies.find_by(movie_id: @movie.id)
    suggestion = current_user.tmdb_suggestions.last.suggestions.find_by(movie_id: @movie.id)
    saved_movie ? @current_suggestion = [saved_movie] : @current_suggestion = [suggestion]
  end

  def after_confirmation
    @movie = Movie.find(params[:movie_id])
    saved_movie = current_user.saved_movies.find_by(movie_id: @movie.id)
    suggestion = current_user.tmdb_suggestions.last.suggestions.find_by(movie_id: @movie.id)
    if saved_movie
      saved_movie.update(seen: true)
    elsif suggestion
      SavedMovie.create(movie: @movie, user: current_user, seen: true)
    end

    redirect_to root_path # should instead redirect to streaming service
  end
end
