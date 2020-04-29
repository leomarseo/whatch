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
  end

  def history_detail
    # needs to set a route too
  end
end



