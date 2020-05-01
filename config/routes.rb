Rails.application.routes.draw do
  devise_for :users

  # Sidekiq Web UI, only for admins.
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # home route
  root to: 'pages#landing'

  get '/profile', to: 'pages#profile'

  # TMDB suggestions route after user selection of filters
  get '/tmdb_suggestions/:params', to: 'tmdb_suggestions#fetcher'

  # route to achievements
  get '/achievements', to: 'achievements#index'

  # routes related to 'History' button in navbar
  get '/history', to: 'saved_movies#history_index', as: 'history_index' #history index
  patch '/history/movie/update/:id', to: 'saved_movies#history_update', as: 'history_update' # change rating button
  get '/history/movie/:id', to: 'saved_movies#history_show', as: 'history_show'  # history show page
  delete '/history/movie/:id', to: 'saved_movies#history_destroy', as: 'history_destroy' # remove button

  # routes related to 'Avatar' button in navbar
  get '/user/:id', to: 'user#show' # profile page that you open when you click on the avatar
    # other routes (e.g. update) are already present thanks to devise. USE THEM!!

  # routes related to 'Saved' button in navbar
  get '/saved', to: 'saved_movies#saved_show', as: "saved_movie" # saved show page, only one movie is show
  get '/saved/pass', to: 'saved_movies#saved_pass', as: "pass_saved_movie"
  get '/saved/remove', to: 'saved_movies#saved_destroy', as: "remove_saved_movie" # remove button

  # routes related to 'Watch now' button in navbar
  get '/search', to: 'suggestions#home'

  # [KK - 23 Apr] removed the /:id from URI - will not be needed for our logic
  get '/results', to: 'suggestions#show'

  get '/results/pass', to: 'suggestions#pass_suggestion', as: 'pass_suggestion'
  get '/results/later', to: 'suggestions#move_to_later', as: 'move_to_later'
  get '/results/seen', to: 'suggestions#already_seen', as: 'already_seen'

  # pass, later and seen buttons won't trigger a new route, they will trigger only different methods that will
  # be activated based on the JS button listener. These methods will be created in the suggestions controller
  get '/pages/home', to: 'pages#home', as: 'home'
  get '/pages/:movie_id/confirmation', to: 'pages#confirmation', as: 'confirmation'
  get '/pages/after_confirmation', to: 'pages#after_confirmation', as: 'after_confirmation'
end
