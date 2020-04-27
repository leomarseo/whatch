class UpdateRelevantActorsJob7 < ApplicationJob
  queue_as :default

  def perform(*args)
    counter = 0
    Movie.all.slice(60000, 10000).each do |movie|

      movie.starring_actors.drop(15).each do |starring_actor|
        counter += 1
        StarringActor.find(starring_actor.id).destroy
      end
    end


    puts "destroyed #{counter} starring_actors"

    actor_counter = 0
    Actor.all.each do |actor|

      if actor.starring_actors == []
        Actor.find(actor.id).destroy
        actor_counter += 1
      end
    end

    puts "destroyed #{actor_counter} actors"
  end
end
