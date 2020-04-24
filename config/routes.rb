Rails.application.routes.draw do
  devise_for :users

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/achievements', to: 'achievements#index'

  # routes related to 'History' button in navbar
  get '/history', to: 'saved_movies#history_index' #history index
  get '/history/movie/:id', to: 'saved_movies#history_show' # history show page
  patch '/history/movie/:id', to: 'saved_movies#history_update' # change rating button
  delete '/history/movie/:id', to: 'saved_movies#history_destroy' # remove button

  # routes related to 'Avatar' button in navbar
  get '/user/:id', to: 'user#show' # profile page that you open when you click on the avatar
    # other routes (e.g. update) are already present thanks to devise. USE THEM!!

  # routes related to 'Saved' button in navbar
  get '/saved/:id', to: 'saved_movies#saved_show' # saved show page, only one movie is show
  delete '/saved/:id', to: 'saved_movies#saved_destroy'# remove button

  # routes related to 'Watch now' button in navbar
  get '/search', to: 'suggestions#home'

  # [KK - 23 Apr] removed the /:id from URI - will not be needed for our logic
  get '/results', to: 'suggestions#show'
  patch '/results', to: 'suggestions#pass_suggestion', as: 'pass_suggestion'
  patch '/results', to: 'suggestions#move_to_later', as: 'move_to_later'
  patch '/results', to: 'suggestions#already_seen', as: 'already_seen'
  # pass, later and seen buttons won't trigger a new route, they will trigger only different methods that will
  # be activated based on the JS button listener. These methods will be created in the suggestions controller
  get '/suggestion/:id/confirmation', to: 'suggestions#confirmation', as: 'confirmation'
end
