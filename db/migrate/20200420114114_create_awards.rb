class CreateAwards < ActiveRecord::Migration[6.0]
  def change
    create_table :awards do |t|
      t.string :award_type
      t.string :category
      t.string :year
      t.references :movie, null: false, foreign_key: true
      t.references :awardable, polymorphic: true

      t.timestamps
    end
  end
end
