class Movie < ApplicationRecord
  belongs_to :director
  has_many :oscars
  has_many :users, through: :seen_movies
  has_many :genres, through: :joint_genres
  has_many :actors, through: :starring_actors
  has_many :services, through: :available_services
end
