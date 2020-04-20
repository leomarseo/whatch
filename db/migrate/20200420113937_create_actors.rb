class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name, null: false
      t.string :age
      t.string :photo_url
      t.string :tmdb_id

      t.timestamps
    end
  end
end
