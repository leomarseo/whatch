class CreateOscars < ActiveRecord::Migration[6.0]
  def change
    create_table :oscars do |t|
      t.string :category, null: false
      t.string :year, null: false
      t.references :movie, null: false, foreign_key: true
      t.references :oscarable, polymorphic: true

      t.timestamps
    end
  end
end
