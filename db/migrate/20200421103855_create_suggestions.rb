class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.references :movie, foreign_key: true
      t.references :tmdb_suggestion, null: false, foreign_key: true
      t.boolean :skip, default: false

      t.timestamps
    end
  end
end
