class UpdateRelevantActorsJob3 < ApplicationJob
  queue_as :default

  def perform(*args)
    actor_counter = 0
    Actor.all.slice(200000, 120000).each do |actor|

      if actor.starring_actors == []
        actor.destroy
        actor_counter += 1
      end
    end

    puts "destroyed #{actor_counter} actors"
  end
end
