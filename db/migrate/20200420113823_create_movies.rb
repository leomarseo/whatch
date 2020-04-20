class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.references :director, null: false, foreign_key: true
      t.string :title, null: false
      t.string :year
      t.string :runtime
      t.text :overview
      t.string :photo_url
      t.string :tmdb_id

      t.timestamps
    end
  end
end
