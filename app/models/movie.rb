class Movie < ApplicationRecord
  belongs_to :director
  has_many :awards

  has_many :seen_movies
  has_many :users, through: :seen_movies

  has_many :joint_genres
  has_many :genres, through: :joint_genres

  has_many :starring_actors
  has_many :actors, through: :starring_actors

  has_many :available_services
  has_many :services, through: :available_services
end
