class SuggestionsController < ApplicationController

  # calls method to set suggestion.skip to true, if user clicks on the pass, later, or seen button in show
  before_action :set_suggestion_skip, only: [ :pass_suggestion, :move_to_later, :already_seen ]

  def show
    # the show accepts a parameter from the filters page
    # the @tmdb_suggestion declaration is temporary, until we successfully receive sample tmdb_suggestions

    @current_suggestion = []
    @tmdb_suggestion = current_user.tmdb_suggestions.last.suggestions

    @tmdb_suggestion.each do |suggestion|
      if suggestion.skip == false
        @current_suggestion << suggestion
        break
      end
    end

    # this loop resets the situation when we reached the last suggestions
    if @current_suggestion == []
      @current_suggestion << @tmdb_suggestion.first
      @tmdb_suggestion.each do |suggestion|
        suggestion.update(skip: false)
      end
    end
  end

  # controller methods for pass, later, seen buttons in show
  # TODO: each method must be updated with the necessary function(s) for each button action
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


  # method to set current suggestion.skip displayed in show to true, then present next suggestion to show
  def set_suggestion_skip
    @suggestion = Suggestion.find(params[:suggestion_id])
    @suggestion.update(skip: true)
    redirect_to results_path
  end

end
