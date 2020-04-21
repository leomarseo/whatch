class TmdbSuggestion < ApplicationRecord
  belongs_to :user

  has_many :joint_suggestions
  has_many :movies, through: :joint_suggestions
end
