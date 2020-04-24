class SuggestionsController < ApplicationController

  before_action :set_suggestion_skip, only: [ :pass_suggestion, :move_to_later, :already_seen ]

  def index
    @suggestion = Suggestion.all
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    suggestion = Suggestion.new(suggestion_params)
    suggestion.save
    redirect_to_pages_suggetions_path
  end

  def show
    # the show accepts a parameter from the filters page
    # the @tmdb_suggestion declaration is temporary, until we successfully receive sample tmdb_suggestions

    @current_suggestion = []
    @tmdb_suggestion = TmdbSuggestion.first.suggestions

    @tmdb_suggestion.each do |suggestion|
      if suggestion.skip == false
        @current_suggestion << suggestion
        break
      end
    end

  end

  def edit
    # @suggestion = Suggestion.find(params[:id])
    # @suggestion.update(skip: true)
    # redirect_to pages_suggestions_path
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update(suggestion_params)
    redirect_to pages_suggestions_path
  end

  def pass_suggestion; end

  def move_to_later; end

  def already_seen; end

  # def destroy
  #   @suggestion = Suggestion.find(params[:id])
  #   @suggestion.update(skip: true)
  #   redirect_to_pages_suggestions_path
  # end

  private

  def suggestion_params
    params.require(:suggestion).permit( :tmdb_suggestion_id, :movie_id, :skip)
  end

  def set_suggestion_skip
    @suggestion = Suggestion.find(params[:suggestion_id])
    @suggestion.update(skip: true)
    redirect_to results_path
  end

end
