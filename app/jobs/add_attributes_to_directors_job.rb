require "json"
require 'open-uri'

class AddAttributesToActorsJob < ApplicationJob
  queue_as :default

  def perform
    Director.order(id: :asc).each do |director|
      url = "https://api.themoviedb.org/3/person/#{director.tmdb_id}?api_key=81c398dbb6b994e4f815e69325c4893c&language=en-US"
      begin
        url_details = open(url).read
      rescue OpenURI::HTTPError
        next # skips the whole creation process if url is not found
      else
        person_details = JSON.parse(url_details)
        director.update(
          popularity: person_details['popularity'],
          photo_url: person_details['profile_path'],
          biography: person_details['biography']
        )
      end
    end
  end

end
