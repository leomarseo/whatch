class Query < ApplicationRecord
  belongs_to :user
  has_one :tmdb_suggestion
end
