class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    actors = Actor.pluck(:name, :photo_url).sort
    @actors_names = []
    @actors_photos = []
    actors.each do |actor|
      @actors_names << actor.first
      @actors_photos << actor.last
    end

    directors = Director.pluck(:name, :photo_url).sort
    @directors_names = []
    @directors_photos = []
    directors.each do |director|
      @directors_names << director.first
      @directors_photos << director.last
    end

    genres = Genre.pluck(:name, :tmdb_id).sort
    @genres_names = []
    @genres_photos = []
    genres.each do |genre|
      @genres_names << genre.first
      @genres_photos << ''
    end
  end
end
