class CreateSeenMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :seen_movies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.integer :user_rating

      t.timestamps
    end
  end
end
