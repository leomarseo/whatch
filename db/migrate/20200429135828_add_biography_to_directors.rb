class AddBiographyToDirectors < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :biography, :text
  end
end
