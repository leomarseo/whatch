class Movie < ApplicationRecord
  belongs_to :director
  has_many :awards

  has_many :saved_movies
  has_many :users, through: :saved_movies

  has_many :joint_genres
  has_many :genres, through: :joint_genres

  has_many :starring_actors
  has_many :actors, through: :starring_actors

  has_many :available_services
  has_many :services, through: :available_services

  has_many :joint_suggestions
  has_many :tmdb_suggestions, through: :joint_suggestions
end
