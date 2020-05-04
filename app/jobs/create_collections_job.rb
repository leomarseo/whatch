class CreateCollectionsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    File.foreach("./db/tmdb_ids/collection_ids_04_19_2020.json").map do |line|
      parsed_line = JSON.parse(line)

      id = parsed_line["id"]
      next if !Collection.find_by(tmdb_id: id).nil?

      begin
        url_details = open("https://api.themoviedb.org/3/collection/#{id}?api_key=81c398dbb6b994e4f815e69325c4893c&language=en-US").read
      rescue OpenURI::HTTPError
        next # skips the whole creation process if url is not found
      else
        collection_details = JSON.parse(url_details)
        collection = Collection.create(
          name: collection_details['name'],
          tmdb_id: id,
          overview: collection_details['overview'],
          photo_url: collection_details['poster_path']
        )

        collection_details['parts'].each do |part|
          movie = Movie.find_by(tmdb_id: part['id'])
          if movie
            movie.update(collection_id: collection.id)
          else
            DownloadSingleMovieJob.perform_now(part['id'])
            Movie.find_by(tmdb_id: part['id']).update(collection_id: collection.id)
          end
        end

      end

    end

  end
end
