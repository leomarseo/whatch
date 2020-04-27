class AddQueryToTmdbSuggestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :tmdb_suggestions, :query, null: false, foreign_key: true
  end
end
