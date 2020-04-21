class CreateTmdbSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :tmdb_suggestions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :tmdb_movie_id_list

      t.timestamps
    end
  end
end
