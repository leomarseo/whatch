class UpdateRelevantActorsJob < ApplicationJob
  queue_as :default

  def perform(amount, starting)
    actor_counter = 0
    Actor.order(id: :asc).limit(amount).offset(starting).each do |actor|

      if actor.starring_actors == []
        actor.destroy
        actor_counter += 1
      end
    end

    puts "destroyed #{actor_counter} actors"
  end
end
