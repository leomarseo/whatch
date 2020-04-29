class AddDifficultyToAchievements < ActiveRecord::Migration[6.0]
  def change
    add_column :achievements, :difficulty, :string
  end
end
