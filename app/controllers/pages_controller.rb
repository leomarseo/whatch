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

    directors = Director.pluck(:name, :photo_url)
    @directors_names = []
    @directors_photos = []
    directors.each do |director|
      @directors_names << director.first
      if director.last.nil?
        @directors_photos << 'director_placeholder'
      else
        @directors_photos << director.last
      end
    end

    genres = Genre.pluck(:name, :tmdb_id)
    @genres_names = []
    @genres_photos = []
    genres.each do |genre|
      @genres_names << genre.first
      @genres_photos << 'genre_placeholder'
    end
  end

  def profile
  end
end
