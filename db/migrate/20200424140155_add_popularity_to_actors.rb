class AddPopularityToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :popularity, :float
  end
end
