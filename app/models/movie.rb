class Movie < ApplicationRecord
  belongs_to :director, optional: true
  belongs_to :collection, optional: true

  has_many :awards

  has_many :saved_movies
  has_many :users, through: :saved_movies

  has_many :joint_genres
  has_many :genres, through: :joint_genres

  has_many :starring_actors
  has_many :actors, through: :starring_actors

  has_many :available_services
  has_many :services, through: :available_services
end
