class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :tmdb_id
      t.string :photo_url

      t.timestamps
    end
  end
end
