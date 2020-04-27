class UpdateRelevantActorsJob3 < ApplicationJob
  queue_as :default

  def perform(*args)
    counter = 0
    Movie.all.slice(20000, 20000).each do |movie|

      movie.starring_actors.drop(15).each do |starring_actor|
        counter += 1
        StarringActor.find(starring_actor.id).destroy
      end
    end

    puts "destroyed #{counter} starring_actors"
end
