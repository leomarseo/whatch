class Actor < ApplicationRecord
  has_many :awards, as: :awardable
  has_many :movies, through: :starring_actors
end
