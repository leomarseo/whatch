class CreateJointSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :joint_suggestions do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :tmdb_suggestion, null: false, foreign_key: true
      t.boolean :skip, default: false

      t.timestamps
    end
  end
end
