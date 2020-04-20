class Genre < ApplicationRecord
  has_many :movies, through: :joint_genres
end
