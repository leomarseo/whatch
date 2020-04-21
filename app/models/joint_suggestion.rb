class JointSuggestion < ApplicationRecord
  belongs_to :movie
  belongs_to :tmdb_suggestion
end
