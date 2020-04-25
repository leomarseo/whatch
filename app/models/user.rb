class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :queries

  has_many :saved_movies
  has_many :movies, through: :saved_movies

  has_many :tmdb_suggestions

  has_one_attached :photo

  has_many :joint_achievements
  has_many :achievements, through: :joint_achievements
end
