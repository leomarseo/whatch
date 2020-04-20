class Actor < ApplicationRecord
  has_many :oscars, as: :oscarable
  has_many :movies, through: :starring_actors
end
