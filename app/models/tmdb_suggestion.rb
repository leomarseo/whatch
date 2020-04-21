class TmdbSuggestion < ApplicationRecord
  belongs_to :user

  has_many :suggestions
end
