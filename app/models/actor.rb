class Actor < ApplicationRecord
  has_many :awards, as: :awardable

  has_many :starring_actors
  has_many :movies, through: :starring_actors
end
