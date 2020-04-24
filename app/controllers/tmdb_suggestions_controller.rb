class TmdbSuggestionsController < ApplicationController
  def get_suggestions
    @actors_positive = params[:actors_positive].split(',')

    raise
  end
end
