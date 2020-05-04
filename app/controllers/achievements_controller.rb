# At ht e bottom of the page i set some variables in the set_variables method :*

class AchievementsController < ApplicationController
  before_action :set_variables
  before_action :achievement_loop_visualisation, :achievement_loop_number_queries, :achievement_loop_hours, :achievement_loop_documentary, :achievement_loop_western, :achievement_loop_directors, :achievement_loop_actors, only: [:index]

  def index
    @achievements = Achievement.all
    @joint_achievements = current_user.joint_achievements
    @types = ["number", "collection", "genre", "hours and queries", "other", "special"]
  end

  #VISUALISATIONS

  def achievement_loop_visualisation
    @achievements = Achievement.where(category: "visualisations")
    @achievements.each do |achievement|
      if @seen_movies.count >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #APP

  def achievement_loop_number_queries
    @achievements = Achievement.where(category: "app")
    @achievements.each do |achievement|
      if current_user.tmdb_suggestions.count >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #HOURS

  def achievement_loop_hours
    @movies_total_runtime = 0
    @seen_movies.each do |seen_movie|
      unless seen_movie.movie.runtime.nil?
        @movies_total_runtime += seen_movie.movie.runtime
      end
    end
    @achievements = Achievement.where(category: "hours")
    @achievements.each do |achievement|
      if @movies_total_runtime >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #CATEGORY-DOCUMENTARY

  def achievement_loop_documentary
    @movies_count = 0
    @seen_movies.each do |seen_movie|
      seen_movie.movie.joint_genres.each do |joint_genre|
        if joint_genre.genre.name == "documentary"
          @movies_count += 1
        end
      end
    end
    @achievements = Achievement.where(category: "documentary")
    @achievements.each do |achievement|
      if @movies_count >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #CATEGORY-WESTERN

  def achievement_loop_western
    @movies_count = 0
    @seen_movies.each do |seen_movie|
      seen_movie.movie.genres.each do |genre|
        if genre.name == "western"
          @movies_count += 1
        end
      end
    end
    @achievements = Achievement.where(category: "western")
    @achievements.each do |achievement|
      if @movies_count >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #DIRECTORS

  def achievement_loop_directors
    # THIS LOOP ONLY CHECKS FOR HERZOG, IF WE WANT TO IMPLEMENT MORE, WE NEED TO CHANGE THE LOGIC AS THIS DOESN'T WORK

    @seen_movies_directed_by_this_director = 0
    @all_movies_directed_by_this_director = Director.find_by(name: "Werner Herzog").movies.count

    @seen_movies.each do |seen_movie|
      @seen_movies_directed_by_this_director += 1 if seen_movie.movie.director.name == "Werner Herzog"
    end
    @achievements = Achievement.where(category: "directors")
    @achievements.each do |achievement|
      if @seen_movies_directed_by_this_director == @all_movies_directed_by_this_director && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #ACTORS

  def achievement_loop_actors
    @seen_movies_with_this_star = 0
    @all_movies_with_this_star = Actor.find_by(name: "Brad Pitt").movies.count

    @seen_movies.each do |seen_movie|
      seen_movie.movie.actors.each do |actor|
        @seen_movies_with_this_star += 1 if actor.name == 'Brad Pitt'
      end
    end
    @achievements = Achievement.where(category: "actors")
    @achievements.each do |achievement|
      if @seen_movies_with_this_star == @all_movies_with_this_star && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #WEIRD

  #Many queries but nothing watched

  def achievement_loop_nothing_watched
    @achievements = Achievement.where(category: "nothing_watched")
    @achievement.each do |achievement|
      if current_user.tmdb_suggestions.count > 15 && @seen_movies.count == 0 && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #Watched many movies with low rating
  def achievement_loop_low_rating
    @low_rating_movies = []
    @seen_movies.each do |seen_movie|
      if seen_movie.movie.vote_average < 5.9
        @low_rating_movies << seen_movie
      end
    end
    @achievements = Achievements.where(category: "low-rating")
    @achievements.each do |achievement|
      if @low_rating_movies.count >= 10 && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #Skip

  def achievement_loop_skip
    @skipped_movies = current_user.suggestions.where(skip: true).count
    @achievements= Achievement.where(category: "skip")
    @achievements.each do |achievement|
      if @skipped_movies >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end

  #ADULT

  def achievement_loop_adult
    @adult_movies = 0
    @seen_movies.each do |seen_movie|
      if seen_movie.movie.adult == true
        @adult_movies += 1
      end
    end
    @achievements = Achievement.where(category: "adult")
    @achievements.each do |achievement|
      if @adult_movies >= achievement.number && @joint_achievements.find_by(achievement_id: achievement.id).nil?
        JointAchievement.create(user_id: current_user.id, achievement_id: achievement.id, earned: true)
      end
    end
  end


  def set_variables
    @seen_movies = current_user.saved_movies.where(seen: true)
    @joint_achievements = current_user.joint_achievements
  end

end # la classe si chiude qui
