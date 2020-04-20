class Director < ApplicationRecord
  has_many :awards, as: :awardable
  has_many :movies
end
