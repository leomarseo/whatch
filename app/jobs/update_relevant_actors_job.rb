class UpdateRelevantActorsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Movie.includes(:starring_actors).first(10000).each do |movie|

      movie.starring_actors.drop(15).each do |starring_actor|
        StarringActor.find(starring_actor.id).destroy
      end
    end


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
