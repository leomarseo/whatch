require "open-uri"
require "nokogiri"

class ScrapeServiceInformationJob < ApplicationJob
  queue_as :default

  def perform(amount, starting)
    Movie.order(id: :asc).limit(amount).offset(starting).each do |movie|
      url = "https://www.themoviedb.org/movie/#{movie.tmdb_id}/watch?language=it-IT"
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)

      results = html_doc.search('.providers')
      p results
    end

  end
end
