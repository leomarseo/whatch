class CreateServicesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # repeat this for all services we need
    Service.create(company: , country: )

    # we need one of this per movie
    AvailableService.create(service_id: 'reference the relevant service', movie_id: 'reference correct movie with OUR id, not tmdb', url: 'link to the movie')
  end
end
