class CreateStarringActors < ActiveRecord::Migration[6.0]
  def change
    create_table :starring_actors do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :actor_references

      t.timestamps
    end
  end
end
