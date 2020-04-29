class AddTrailerUrlToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :trailer_url, :string
  end
end
