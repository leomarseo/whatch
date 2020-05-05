class CreateAchievementsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # VISUALISATIONS
    Achievement.create(name: "Newbie", description: "You watched 1 movie", category: "visualisations", number: 1, macro_area: "number", icon: "achievements/newbie.svg")
    Achievement.create(name: "Rookie", description: "You watched 5 movies", category: "visualisations", number: 5, macro_area: "number", icon: "achievements/rookie.svg")
    Achievement.create(name: "Beginner", description: "You watched 10 movies", category: "visualisations", number: 10, macro_area: "number", icon: "achievements/beginner.svg")
    Achievement.create(name: "Intermediate", description: "You watched 100 movies", category: "visualisations", number: 100, macro_area: "number", icon: "achievements/intermediate.svg")
    Achievement.create(name: "Expert", description: "You watched 500 movies", category: "visualisations", number: 500, macro_area: "number", icon: "achievements/expert.svg")
    Achievement.create(name: "Unstoppable", description: "You watched 1000 movies", category: "visualisations", number: 1000, macro_area: "number", icon: "achievements/unstoppable.svg")

    # COLLECTION
    Achievement.create(name: "May the force be with you", description: "You watched the entire Star Wars saga", category: "collection", number: 10, macro_area: "collection", icon: "achievements/may_the_force.svg")
    Achievement.create(name: "200 points to Gryffindor", description: "You watched the entire Harry Potter saga", category: "collection", number: 1241, macro_area: "collection", icon: "achievements/harry_potter.svg")
    Achievement.create(name: "You're back", description: "You watched the entire Terminator saga", category: "collection", number: 528, macro_area: "collection", icon: "achievements/youre_back.svg")
    Achievement.create(name: "Adrianaaaa!", description: "You watched the entire Rocky saga", category: "collection", number: 1575, macro_area: "collection", icon: "achievements/adriana.svg")

    #CATEGORY - DOCUMENTARY
    Achievement.create(name: "The professor", description: "You watched 10 documentaries", category: "documentary", number: 10, macro_area: "genre", icon: "achievements/the_professor.svg")

    #CATEGORY - WESTERN
    Achievement.create(name: "Yeee-ha", description: "You watched 10 wild west movies", category: "western", number: 10, macro_area: "genre", icon: "achievements/yeee_ha.svg")

    #CATEGORY - COMEDY
    Achievement.create(name: "Ha ha ha", description: "You watched 5 comedies", category: "comedy", number: 5, macro_area: "genre", icon: "achievements/hahaha.svg")
    Achievement.create(name: "I can't stop laughing", description: "You watched 10 comedies", category: "comedy", number: 10, macro_area: "genre", icon: "achievements/i_cant_stop_laughing.svg")
    Achievement.create(name: "ROFL", description: "You watched 30 comedies", category: "comedy", number: 30, macro_area: "genre", icon: "achievements/i_really_really_cant_stop_laughing.svg")

    #CATEGORY - ADULT
    # Achievement.create(name: "Amateur", description: "You watched 3 adult movies", category: "adult", number: 3, macro_area: "special")
    # Achievement.create(name: "It's cheaper than dating", description: "You watched 10 adult movies", category: "adult", number: 10, macro_area: "special")

    #STRANGE
    Achievement.create(name: "Fetishist", description: "You watched 10 unpopular movies", category: "low-rating", number: 10, macro_area: "special")
    # Achievement.create(name: "What's the matter with you", description: "You didn't watch anything", category: "nothing-watched", number: 15, macro_area: "special") #The user made the query but he actually didn't watch anything
    Achievement.create(name: "Calm down", description: "You skipped 100 movies", category: "skip", number: 100, macro_area: "special", icon: "achievements/calm_down.svg")
    Achievement.create(name: "It's not Tinder", description: "You skipped 500 movies", category: "skip", number: 500, macro_area: "special", icon: "achievements/its_not_tinder.svg")

    #APP
    Achievement.create(name: "He who seeks finds", description: "You run 10 queries", category: "app", number: 10, macro_area: "hours and queries", icon: "achievements/he_who_seeks_finds.svg")
    Achievement.create(name: "Archeologist", description: "You run 50 queries", category: "app", number: 50, macro_area: "hours and queries", icon: "achievements/archeologist.svg")
    Achievement.create(name: "Query master", description: "You run 100 queries", category: "app", number: 100, macro_area: "hours and queries", icon: "achievements/query_master.svg")
    Achievement.create(name: "Sherlock", description: "You run 1000 queries", category: "app", number: 1000, macro_area: "hours and queries", icon: "achievements/sherlock.svg")

    #HOURS
    Achievement.create(name: "Watcher", description: "You watched 20 hours of movies", category: "hours", number: 1200, macro_area: "hours and queries", icon: "achievements/watcher.svg")
    Achievement.create(name: "Red eyes", description: "You watched 60 hours of movies", category: "hours", number: 6000, macro_area: "hours and queries", icon: "achievements/red_eyes.svg")
    Achievement.create(name: "Whatcher pro", description: "You watched 100 hours of movies", category: "hours", number: 30000, macro_area: "hours and queries", icon: "achievements/whatcher_pro.svg")

    #ACTORS
    Achievement.create(name: "Brad forever", description: "You watched all the movies starring Brad Pitt", category: "actors", number: 9, macro_area: "other", icon: "achievements/brad_forever.svg")

    #DIRECTORS
    Achievement.create(name: "Nosferatu", description: "You watched all the movies directed by Werner Herzog", category: "directors", number: 9, macro_area: "other", icon: "achievements/nosferatu.svg")
  end
end
