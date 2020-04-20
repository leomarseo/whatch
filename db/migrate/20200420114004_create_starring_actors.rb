class CreateStarringActors < ActiveRecord::Migration[6.0]
  def change
    create_table :starring_actors do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.string :character

      t.timestamps
    end
  end
end
