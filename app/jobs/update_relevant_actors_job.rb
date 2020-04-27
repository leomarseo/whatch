class UpdateRelevantActorsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    actor_counter = 0
    Actor.all.first(100000).each do |actor|

      if actor.starring_actors == []
        actor.destroy
        actor_counter += 1
      end
    end

    puts "destroyed #{actor_counter} actors"
  end
end
