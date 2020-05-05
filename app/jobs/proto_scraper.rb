
require 'open-uri'
require 'nokogiri'
tmbdid = 106646
url = "https://www.themoviedb.org/movie/#{tmbdid}/watch?language=en-US&locale=US"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
movie = {
  tmbdid: tmbdid,
  netflix: "",
  timvision: "",
  FXNow: ""
}
html_doc.search('.providers a').each do |element|
  movie[:netflix] = element.attribute('href').to_s if element.attribute('title').to_s.include? 'Netflix'
  movie[:timvision] = element.attribute('href').to_s if element.attribute('title').to_s.include? 'Tim'
  movie[:FXNow] = element.attribute('href').to_s if element.attribute('title').to_s.include? 'FXNow'
end
puts movie