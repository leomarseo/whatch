class SavedMoviesController < ApplicationController
  def saved_show
    @user = current_user
    @saved_movies = @user.saved_movies.where(seen: false).includes(:movie)
  end

  def saved_destroy
    @saved_movie = SavedMovie.find(params[:id])
    next_id = find_next_id(@saved_movie)
    @saved_movie.destroy
    redirect_to saved_movie_path(next_id)
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
end



