class AddColumnsToAchievements < ActiveRecord::Migration[6.0]
  def change
    add_column :achievements, :category, :string
    add_column :achievements, :number, :integer
  end
end
