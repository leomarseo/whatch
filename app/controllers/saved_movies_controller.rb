class SavedMoviesController < ApplicationController
  def saved_show
    @current_saved_movie = []
    @second_saved_movie = []
    @saved_movies = current_user.saved_movies.where(seen: false)

    @render_static_page = false
    @multiple_cards = true
    @multiple_movies = true

    if @saved_movies.size == 0
      @render_static_page = true
    elsif @saved_movies.size == 1
      @current_saved_movie << @saved_movies.first
      @multiple_movies = false
    else
      counter = 0;
      @saved_movies.each do |saved_movie|
        if saved_movie.skip == false && counter == 0
          @current_saved_movie << saved_movie
          counter += 1
        elsif saved_movie.skip == false && counter == 1
          @second_saved_movie << saved_movie
          counter = 0
          break
        end
      end

      # this loop resets the situation when we reached the last suggestions
      if @current_saved_movie == []
        @current_saved_movie << @saved_movies.first
        @saved_movies.each do |saved_movie|
          saved_movie.update(skip: false)
        end
      end
    end
  end

  def saved_destroy
    SavedMovie.find(params[:id]).destroy
    redirect_to saved_movie_path
  end

  def saved_pass
    SavedMovie.find(params[:id]).update(skip: true)
    redirect_to saved_movie_path
  end

  def saved_watch
    redirect_to watch_confirmation_path(movie_id: SavedMovie.find(params[:id]).movie.id)
  end

  def history_index
    @seen_movies = current_user.saved_movies.where(seen: true)
  end

  def history_show
    # needs to set a route too
    @current_movie = [SavedMovie.find(params[:id])] #needs to be an array
    # @current_movie = Movie.find(params[:id]) #not an object
    @current_rating = @current_movie.first.user_rating

    @rating = rating_icon
    # @rating_dislike = rating_icon_dislike
  end

  def rating_icon
    if @current_rating == 1
      return "icons/disliked_hover.svg"
    else
      return "icons/liked_hover.svg"
    end

  end

  # def rating_icon_dislike
  #   if @current_rating == 0
  #     return "icons/disliked_hover.svg"
  #   else
  #     return "icons/disliked.svg"
  #   end

  # end

  def history_update
    @saved_movie = SavedMovie.find(params[:id])

    # legacy: makes a button behave like a switch to change the rating of a given movie
    @saved_movie.user_rating == 1 ? @saved_movie.update(user_rating: 0) : @saved_movie.update(user_rating: 1)
    redirect_to history_show_path(@saved_movie)
  end

  def history_destroy
    SavedMovie.find(params[:id]).destroy
    redirect_to history_index_path
  end
end
