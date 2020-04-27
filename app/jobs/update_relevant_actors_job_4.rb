class UpdateRelevantActorsJob4 < ApplicationJob
  queue_as :default

  def perform(*args)
    counter = 0
    Movie.includes(:starring_actors).slice(30000, 10000).each do |movie|

      movie.starring_actors.drop(15).each do |starring_actor|
        counter += 1
        StarringActor.find(starring_actor.id).destroy
      end
    end

    puts "destroyed #{counter} starring_actors"

    # actor_counter = 0
    # Actor.includes(:starring_actors).each do |actor|

    #   if actor.starring_actors == []
    #     Actor.find(actor.id).destroy
    #     actor_counter += 1
    #   end
    # end

    # puts "destroyed #{actor_counter} actors"
  end
end
