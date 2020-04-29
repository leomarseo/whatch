class SavedMoviesController < ApplicationController
  def saved_show
    @current_saved_movie = []
    @second_saved_movie = []
    @saved_movies = current_user.saved_movies.where(seen: false)
    counter = 0;

    # every time we create a user, we'll add two saved_movies connected to the ghost movie
    # whenever we have more than 2 saved movies, it means the user has saved some movies, so we can skip the first and the second ghost ones
    if @saved_movies.size > 2
      @saved_movies.first(2).each do |saved_movie|
        saved_movie.update(skip: true)
      end
    end

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

  def saved_destroy
    @saved_movie = SavedMovie.find(params[:id])
    next_id = find_next_id(@saved_movie)
    @saved_movie.destroy
    redirect_to saved_movie_path(id: next_id)
  end

  def find_next_id(current_movie)
    @saved_movies = current_user.saved_movies.where(seen: false)
    next_index = @saved_movies.index(current_movie) +1  # i take the index of the next movie in the array
    if current_movie != @saved_movies.last # if the movie that i'm seeing is not the last one
      next_id = @saved_movies[next_index].id # next_id is equal to the id of the next movie in the array (retrived by the next_index)
    else
      next_id = @saved_movies.first.id # otherwise the next_id is the id of the first object/movie in the @saved_movies array
    end
    return next_id
  end

  helper_method :find_next_id
  # moved find_next_id inside the SavedMoviesController and used helper_method

  def history_index
  end

  def history_detail
    # needs to set a route too
  end
end



