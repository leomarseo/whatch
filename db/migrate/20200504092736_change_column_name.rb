class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
     rename_column :achievements, :difficulty, :macro_area
  end
end
