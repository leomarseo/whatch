require "open-uri"
require "nokogiri"

class ScrapeServiceInformationJob < ApplicationJob
  queue_as :default

  def perform
    # LUIGI'S SCRAPER

    tmbdid = 106646
    url = "https://www.themoviedb.org/movie/#{tmbdid}/watch"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    movie = {
      tmbdid: tmbdid,
      netflix: "",
      timvision: ""
    }
    html_doc.search('.providers a').each do |element|
      movie[:netflix] = element.attribute('href').to_s if element.attribute('title').to_s.include? 'Netflix'
      movie[:timvision] = element.attribute('href').to_s if element.attribute('title').to_s.include? 'Tim'
    end
    puts movie

  end
end
