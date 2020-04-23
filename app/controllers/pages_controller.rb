class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :autocomplete]

  def home
    @actors = Actor.pluck(:name).sort
    @directors = Director.pluck(:name).sort
    @genres = Genre.pluck(:name).sort
  end

end
