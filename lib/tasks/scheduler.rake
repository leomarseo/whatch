desc "download movies from tmdb API"
task download_movies: :environment do
  DownloadMovieJob.perform_now
end
