class SavedMoviesController < ApplicationController
  def saved_show
    ghost_movie = Movie.find_by(tmdb_id: -1)
    current_user.saved_movies.where(movie_id: ghost_movie.id).each do |saved_movie|
      saved_movie.destroy
    end

    @saved_movies = current_user.saved_movies.where(seen: false)

    if @saved_movies.length == 0
      SavedMovie.create(user: current_user, movie: Movie.find_by(tmdb_id: -1))
      SavedMovie.create(user: current_user, movie: Movie.find_by(tmdb_id: -1))
    elsif @saved_movies.length == 1
      SavedMovie.create(user: current_user, movie: Movie.find_by(tmdb_id: -1))
    end

    @saved_movies = current_user.saved_movies.where(seen: false)

    if params[:id] == 'nav'
      @current_movie = @saved_movies.sample
      @second_movie = SavedMovie.find(find_next_id(@current_movie))
    else
      @current_movie = SavedMovie.find(params[:id])
      @second_movie = SavedMovie.find(find_next_id(@current_movie))
    end
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

  def history_index
    @seen_movies = current_user.saved_movies.where(seen: true)
  end

  def history_show
    # needs to set a route too
    @current_movie = [SavedMovie.find(params[:id])] #needs to be an array
    # @current_movie = Movie.find(params[:id]) #not an object
    @current_rating = @current_movie.first.user_rating

    @rating = rating_icon
  end

  def rating_icon
    if @current_rating == 1
      return "icons/liked.svg"
    elsif @current_rating == 0
      return "icons/disliked.svg"
    else
      return "icons/placeholder_actor.svg"
    end

  end

  def history_update
    @saved_movie = SavedMovie.find(params[:id])
    @saved_movie.user_rating == 1 ? @saved_movie.update(user_rating: 0) : @saved_movie.update(user_rating: 1)
    redirect_to history_show_path(@saved_movie)
  end
end
