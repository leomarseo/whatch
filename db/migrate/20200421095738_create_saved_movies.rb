class CreateSavedMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_movies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.integer :user_rating
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
