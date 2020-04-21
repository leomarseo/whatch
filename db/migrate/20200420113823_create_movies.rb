class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.references :director, foreign_key: true
      t.string :title, null: false
      t.string :original_title
      t.string :release_date
      t.integer :runtime
      t.text :overview
      t.string :photo_url
      t.integer :tmdb_id
      t.float :vote_average
      t.integer :vote_count
      t.string :tagline
      t.integer :belongs_to_collection

      t.timestamps
    end
  end
end
