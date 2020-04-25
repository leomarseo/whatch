class CreateQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :queries do |t|
      t.references :user
      t.text :positive_actors_tmdb_ids, array:true, default: []
      t.text :negative_actors_tmdb_ids, array:true, default: []
      t.text :positive_directors_tmdb_ids, array:true, default: []
      t.text :negative_directors_tmdb_ids, array:true, default: []
      t.text :positive_genres_tmdb_ids, array:true, default: []
      t.text :negative_genres_tmdb_ids, array:true, default: []

      t.timestamps
    end
  end
end
