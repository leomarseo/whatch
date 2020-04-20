class Genre < ApplicationRecord
  has_many :movies, through: :joint_genres
  has_one_attached :photo
end
