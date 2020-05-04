class RemoveBelongsToCollectionFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :belongs_to_collection, :string
  end
end
