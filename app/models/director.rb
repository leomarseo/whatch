class Director < ApplicationRecord
  has_many :oscars, as: :oscarable
  has_many :movies
end
