class AddPopularityToDirectors < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :popularity, :float
  end
end
