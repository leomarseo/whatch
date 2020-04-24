class SuggestionsController < ApplicationController

  def index
    @suggestion = Suggestion.all
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    suggestion = Suggestion.new(suggestion_params)
    suggestion.save
    redirect_to pages_suggestions_path
  end

  def suggestion_show
    @user = current_user
    @suggestions = @user.tmdb_suggestions.first.suggestions.where(skip: false)
  end

  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update(skip: true)
  end

  def skip
    @suggestion = Suggestion.find(params[:id])
    next_id = find_next_id(@suggestion)
    @suggestion.update(skip: :true)
    redirect_to show_suggestions_path(next_id)
  end

  def find_next_id(current_suggestion)
    @suggestions = current_user.tmdb_suggestions.first.suggestions.where(skip: :false)
    next_index = @suggestions.index(current_suggestion) + 1
    if current_suggestion != @suggestions.last
      next_id = @suggestions[next_index].id
    else
      next_id = @suggestions.first.id
    end
    return next_id
  end

  helper_method :find_next_id
  # def destroy
  #   @suggestion = Suggestion.find(params[:id])
  #   @suggestion.update(skip: true)
  #   redirect_to_pages_suggestions_path
  # end

  private

  def suggestion_params
    params.require(:suggestion).permit( :tmdb_suggestion_id, :movie_id, :skip)
  end

end
