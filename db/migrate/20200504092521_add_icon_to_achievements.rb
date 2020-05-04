class AddIconToAchievements < ActiveRecord::Migration[6.0]
  def change
    add_column :achievements, :icon, :string
  end
end
