class TmdbSuggestion < ApplicationRecord
  belongs_to :user
  belongs_to :query

  has_many :suggestions
end
