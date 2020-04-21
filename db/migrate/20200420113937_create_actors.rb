class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name, null: false
      t.string :photo_url
      t.integer :tmdb_id

      t.timestamps
    end
  end
end
