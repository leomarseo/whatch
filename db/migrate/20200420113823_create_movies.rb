class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.references :director, null: false, foreign_key: true
      t.string :year, null: false
      t.string :duration
      t.text :plot, null: false
      t.text :extended_plot
      t.string :age_restriction
      t.string :image_url

      t.timestamps
    end
  end
end
