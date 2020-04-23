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
    redirect_to_pages_suggestions_path
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @movies = Movie.all
    @tmdb_suggestions = TmdbSuggestion.all
  end

  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update(skip: true)
    redirect_to_pages_suggestions_path
  end

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
