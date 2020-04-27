class RemoveForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_reference :joint_achievements, :saved_movie, index: true, foreign_key: true
  end
end
