require "open-uri"
require "nokogiri"

class ScrapeServiceInformationJob < ApplicationJob
  queue_as :default

  # def perform(amount, starting)
  #   Movie.order(id: :asc).limit(amount).offset(starting).each do |movie|
  #     url = "https://www.themoviedb.org/movie/#{movie.tmdb_id}/watch?language=it-IT"
  #     html_file = open(url).read
  #     html_doc = Nokogiri::HTML(html_file)

  #     results = html_doc.search('.providers')
  #     p results
  #   end

  # end

  def perform
    url = "https://www.themoviedb.org/movie/284053/watch?language=it-IT"
    html_doc = Nokogiri::HTML(open(url))

    link_array = nil
    title_array = nil

    html_doc.css('ul.providers li.ott_filter_4k').each do |link|
      link.at_css('a').each do |node|
        p node
      end
    end

    # puts link_array
    # puts 'stop'
    # puts title_array

  end
end
