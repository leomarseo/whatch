require "json"
require 'open-uri'

class CreateCollectionsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    url = open("./db/tmdb_ids/genres.json").read
    data = JSON.parse(url)
    data['genres'].each do |genre|
      Genre.create(name: genre['name'], tmdb_id: genre['id'])
    end
  end
end
