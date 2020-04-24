class AchievementsController < ApplicationController
  before_action :n_movie_achievement, only: [:index]
  before_action :set_variables

  def index
    @achievements = Achievement.all
  end

  def achievement_loop_visualisation
    @achievements = Achievement.where(category: "visualisations")
    @achievements.each do |achievement|
      if @seen_movies.count >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  def achievement_loop_adult #controllare che adult sia una categoria e non un boolean del movie
    @movies = @seen_movies.movie.genres.where(name: "adult")
    @achievements = Achievement.where(category: "adult")
    @achievements.each do |achievement|
      if @movies.count >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  def achievement_loop_documentary
    @movies = @seen_movies.movie.genres.where(name: "documentary")
    @achievements = Achievement.where(category: "documentary")
    @achievements.each do |achievement|
      if @movies.count >= achievement.number && @joint_achievements.find_by(achivement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  def achievement_loop_hours
    @movies_total_duration = @seen_movies.movie.genres.where(name: "documentary")
    @achievements = Achievement.where(category: "documentary")
    @achievements.each do |achievement|
      if @movies.count >= achievement.number && @joint_achievements.find_by(achivement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end





  def set_variables
    @seen_movies = current_user.saved_movies.where(seen: true)
    @joint_achievements = current_user.joint_achievements
  end

  # genre = current_user.saved_movies.where(seen: true).last.movie.genres.where()

  # def genre_achivement(genre)

  # end

  # helper_method :n_movie_achievement








end # la classe si chiude qui

  # def n_movie_achievement # a method to give achievements based on the number of movie you watched
  #   if current_user.saved_movies.where(seen: true).count > 1 && current_user.joint_achievements.find_by(achievement_id: 1).nil?
  #     JointAchievement.create(user_id: current_user.id, achievement_id: 1, earned: true)
  #   # elsif @seen_movies.count == 5 && current_user.joint_achievement.earned = false
  #   #   JointAchievement.create(user_id: 2, achievement_id: 2, earned: true)
  #   # elsif @seen_movies.count == 10 && current_user.joint_achievement.earned = false
  #   #   JointAchievement.create(user_id: 2, achievement_id: 3, earned: true)
  #   # elsif @seen_movies.count == 100 && current_user.joint_achievement.earned = false
  #   #   JointAchievement.create(user_id: 2, achievement_id: 4, earned: true)
  #   # elsif @seen_movies.count == 500 && current_user.joint_achievement.earned = false
  #   #   JointAchievement.create(user_id: 2, achievement_id: 5, earned: true)
  #   end
