class CreateAchievementsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # VISUALISATIONS
    Achievement.create(name: "Newbie", description: "You saw 1 movie", category: "visualisations", number: 1, macro_area: "number", icon: "newbie.svg")
    Achievement.create(name: "Rookie", description: "You saw 5 movies", category: "visualisations", number: 5, macro_area: "number", icon: "rookie.svg")
    Achievement.create(name: "Beginner", description: "You saw 10 movies", category: "visualisations", number: 10, macro_area: "number", icon: "beginner.svg")
    Achievement.create(name: "Intermediate", description: "You saw 100 movies", category: "visualisations", number: 100, macro_area: "number", icon: "intermediate.svg")
    Achievement.create(name: "Expert", description: "You saw 500 movies", category: "visualisations", number: 500, macro_area: "number", icon: "expert.svg")
    Achievement.create(name: "Unstoppable", description: "You saw 1000 movies", category: "visualisations", number: 1000, macro_area: "number", icon: "unstoppable.svg")

    # COLLECTION
    Achievement.create(name: "May the force be with you", description: "You saw all the Star Wars saga", category: "collection", number: 6, macro_area: "collection", icon: "may_the_force.svg")
    Achievement.create(name: "200 points to Gryffindor", description: "You saw all the Harry Potter saga", category: "collection", number: 8, macro_area: "collection", icon: "harry_potter.svg")
    Achievement.create(name: "You're back", description: "You saw all the Terminator", category: "collection", number: 6, macro_area: "collection", icon: "youre_back.svg")
    Achievement.create(name: "Adrianaaaa!", description: "You saw all the Rocky collection", category: "collection", number: 6, macro_area: "collection", icon: "adriana.svg")

    #CATEGORY - DOCUMENTARY
    Achievement.create(name: "The professor", description: "You saw 10 documentary", category: "documentary", number: 10, macro_area: "genre", icon: "the_professor.svg")

    #CATEGORY - WESTERN
    Achievement.create(name: "Yeee-ha", description: "You saw 10 western movie", category: "western", number: 10, macro_area: "genre", icon: "yeee_ha.svg")

    #CATEGORY - COMEDY
    Achievement.create(name: "Ha ha ha", description: "You saw 5 comedies", category: "comedy", number: 5, macro_area: "genre", icon: "hahaha.svg")
    Achievement.create(name: "I can't stop laughing", description: "You saw 10 comedies", category: "comedy", number: 10, macro_area: "genre", icon: "i_cant_stop_laughing.svg")
    Achievement.create(name: "I really really can't stop laughing", description: "You saw 10 comedies", category: "comedy", number: 30, macro_area: "genre", icon: "i_really_really_cant_stop_laughing.svg")

    #CATEGORY - ADULT
    Achievement.create(name: "Amateur", description: "You saw 3 adult movies", category: "adult", number: 3, macro_area: "special")
    Achievement.create(name: "It's cheaper than dating", description: "You saw 10 adult movies", category: "adult", number: 10, macro_area: "special")

    #STRANGE
    Achievement.create(name: "Fetishist", description: "You saw 10 movies with low rating", category: "low-rating", number: 10, macro_area: "special")
    Achievement.create(name: "What's the matter with you", description: "You didn't watch anything", category: "nothing-watched", number: 15, macro_area: "special", icon: "calm_down.svg") #The user made the query but he actually didn't watch anything
    Achievement.create(name: "Calm down", description: "You skipped 100 movies", category: "skip", number: 100, macro_area: "special")
    Achievement.create(name: "It's not Tinder", description: "You skipped 500 movies", category: "skip", number: 500, macro_area: "special", icon: "its_not_tinder.svg")

    #APP
    Achievement.create(name: "He who seeks finds", description: "You did 10 queries", category: "app", number: 10, macro_area: "hours and queries", icon: "he_who_seeks_find.svg")
    Achievement.create(name: "Archeologist", description: "You did 50 queries", category: "app", number: 50, macro_area: "hours and queries", icon: "archeologist.svg")
    Achievement.create(name: "Query master", description: "You did 100 queries", category: "app", number: 100, macro_area: "hours and queries", icon: "query_master.svg")
    Achievement.create(name: "Sherlock", description: "You did 1000 queries", category: "app", number: 1000, macro_area: "hours and queries", icon: "sherlock.svg")

    #HOURS
    Achievement.create(name: "Watcher", description: "You watched 20 hours of movies", category: "hours", number: 1200, macro_area: "hours and queries", icon: "watcher.svg")
    Achievement.create(name: "Red eyes", description: "You watched 60 hours of movies", category: "hours", number: 6000, macro_area: "hours and queries", icon: "red_eyes.svg")
    Achievement.create(name: "Whatcher pro", description: "You watched 100 hours of movies", category: "hours", number: 30000, macro_area: "hours and queries", icon: "watcher_pro.svg")

    #ACTORS
    Achievement.create(name: "Brad forever", description: "You watched all the movies starring Brad Pitt", category: "actors", number: 9, macro_area: "other")

    #DIRECTORS
    Achievement.create(name: "Nosferatu", description: "You watched all the movies directed by Werner Herzog", category: "directors", number: 9, macro_area: "other")
  end
end
