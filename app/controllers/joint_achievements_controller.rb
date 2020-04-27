class JointAchievementsController < ApplicationController
  def index
    @joint_achievements = JointAchievement.all
  end
end
