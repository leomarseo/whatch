require "json"
require 'open-uri'

class AddAttributesToActorsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    counter = 0
    File.foreach("./db/tmdb_ids/person_ids_04_19_2020.json").map do |line|
      counter += 1
      break if counter > 10

      parsed_line = JSON.parse(line)
      actor = Actor.find_by(tmdb_id: parsed_line["id"])

      # adds pupularity if nil
      if actor && actor[:popularity].nil?
        actor.update(popularity: parsed_line["popularity"])
      end

      # adds photo url if nil and if it finds it in starring actor
      if actor && actor.photo_url.nil?
        actor.starring_actors.each do |starring|
          unless starring.photo_url.nil?
            actor.update(photo_url: starring.photo_url)
            break
          end
        end
      end

      # finally calls the API if the no starring actor cointained a photo_url
      if actor && actor.photo_url.nil?
        begin
          url_people_details = open("https://api.themoviedb.org/3/person/#{actor.tmdb_id}?api_key=81c398dbb6b994e4f815e69325c4893c&language=en-US").read
        rescue OpenURI::HTTPError
          next
        else
          person_details = JSON.parse(url_people_details)
          actor.update(photo_url: person_details['profile_path'])
        end
      end

    end
  end
end
