class AddSkipToSavedMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :saved_movies, :skip, :boolean, default: false
  end
end
