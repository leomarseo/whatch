class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.text :overview
      t.string :photo_url
      t.integer :tmdb_id
    end
  end
end
