class JointAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :saved_movie
  belongs_to :achievement
end
