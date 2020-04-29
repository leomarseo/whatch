class DownloadTrailerUrlJob < ApplicationJob
  queue_as :default

  def perform(amount, starting)
    Movie.order(id: :asc).limit(amount).offset(starting).each do |movie|
      url = "https://api.themoviedb.org/3/movie/#{movie.tmdb_id}/videos?api_key=81c398dbb6b994e4f815e69325c4893c&language=en-US"
      begin
        url_videos = open(url).read
      rescue OpenURI::HTTPError
        next # skips the whole creation process if url is not found
      else
        video_details = JSON.parse(url_videos)

        unless video_details['results'] == []
          site = video_details['results'].first['site']
          if site == 'YouTube'
            youtube_url = "https://www.youtube.com/watch?v=#{video_details['results'].first['key']}"
            movie.update(trailer_url: youtube_url)
          end
        end

      end
    end

  end

end
