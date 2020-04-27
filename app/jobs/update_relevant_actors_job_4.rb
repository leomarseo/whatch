class UpdateRelevantActorsJob4 < ApplicationJob
  queue_as :default

  def perform(*args)
    counter = 0
    Movie.all.slice(40000, 20000).each do |movie|

      movie.starring_actors.drop(15).each do |starring_actor|
        counter += 1
        StarringActor.find(starring_actor.id).destroy
      end
    end
  end
end
