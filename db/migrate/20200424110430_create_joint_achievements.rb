class CreateJointAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :joint_achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :saved_movie, null: false, foreign_key: true
      t.references :achievement, null: false, foreign_key: true
      t.boolean :earned

      t.timestamps
    end
  end
end
