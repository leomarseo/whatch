class CreateOscars < ActiveRecord::Migration[6.0]
  def change
    create_table :oscars do |t|
      t.string :category
      t.string :year
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
