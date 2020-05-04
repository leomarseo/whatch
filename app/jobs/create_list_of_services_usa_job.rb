class CreateListOfServicesUsaJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # repeat this for all services we need
    Service.create(company: "Apple iTunes", country: "USA") #1
    Service.create(company: "Google Play Movies", country: "USA") #2
    Service.create(company: "Vudu", country: "USA") #3
    Service.create(company: "Netflix", country: "USA") #4
    Service.create(company: "Amazon Prime Video", country: "USA") #5
    Service.create(company: "Amazon Video", country: "USA") #6
    Service.create(company: "Mubi", country: "USA") #7
    Service.create(company: "Crackle", country: "USA") #8
    Service.create(company: "realeyz", country: "USA") #9
    Service.create(company: "Hulu", country: "USA") #10
    Service.create(company: "Fandor", country: "USA") #11
    Service.create(company: "HBO Now", country: "USA") #12
    Service.create(company: "HBO Go", country: "USA") #13
    Service.create(company: "Showtime", country: "USA") #14
    Service.create(company: "Now TV", country: "USA") #15
    Service.create(company: "Starz", country: "USA") #16
    Service.create(company: "Microsoft Store", country: "USA") #17
    Service.create(company: "Tubi TV", country: "USA") #18
    Service.create(company: "CBS", country: "USA") #19
    Service.create(company: "NBC", country: "USA") #20
    Service.create(company: "AMC", country: "USA") #21
    Service.create(company: "The CW", country: "USA") #22
    Service.create(company: "Acorn TV", country: "USA") #23
    Service.create(company: "Shudder", country: "USA") #24
    Service.create(company: "GuideDoc", country: "USA") #25
    Service.create(company: "FandangoNow", country: "USA") #26
    Service.create(company: "FXNow", country: "USA") #27
    Service.create(company: "Max Go", country: "USA") #28
    Service.create(company: "Sundance Now", country: "USA") #29
    Service.create(company: "ABC", country: "USA") #30
    Service.create(company: "Brit Box", country: "USA") #31
    Service.create(company: "History", country: "USA") #32
    Service.create(company: "A&E", country: "USA") #33
    Service.create(company: "Lifetime", country: "USA") #34
    Service.create(company: "Netflix Kids", country: "USA") #35
    Service.create(company: "Pantaflix", country: "USA") #36
    Service.create(company: "Screambox", country: "USA") #37
    Service.create(company: "Youtube Premium", country: "USA") #38
    Service.create(company: "Curiosity Stream", country: "USA") #39
    Service.create(company: "Kanopy", country: "USA") #40
    Service.create(company: "Youtube", country: "USA") #41
    Service.create(company: "Starz Play Amazon Channel", country: "USA") #42
    Service.create(company: "AcornTV Amazon Channel", country: "USA") #43
    Service.create(company: "BritBox Amazon Channel", country: "USA") #44
    Service.create(company: "CBS All Access Amazon Channel", country: "USA") #45
    Service.create(company: "Fandor Amazon Channel", country: "USA") #46
    Service.create(company: "HBO Now Amazon Channel", country: "USA") #47
    Service.create(company: "Mubi Amazon Channel", country: "USA") #48
    Service.create(company: "Screambox Amazon Channel", country: "USA") #49
    Service.create(company: "Showtime Amazon Channel", country: "USA") #50
    Service.create(company: "Shudder Amazon Channel", country: "USA") #51
    Service.create(company: "Sundance Amazon Channel", country: "USA") #52
    Service.create(company: "CS Seed", country: "USA") #53
    Service.create(company: "The Roku Channel", country: "USA") #54
    Service.create(company: "PBS", country: "USA") #55
    Service.create(company: "Freeform", country: "USA") #56
    Service.create(company: "Hoopla", country: "USA") #57
    Service.create(company: "Syfy", country: "USA") #58
    Service.create(company: "Eros Now", country: "USA") #59
    Service.create(company: "DC Universe", country: "USA") #60
    Service.create(company: "Youtube Free", country: "USA") #61
    Service.create(company: "IMDb TV", country: "USA") #62
    Service.create(company: "Popcornflix", country: "USA") #63
    Service.create(company: "Comedy Central", country: "USA") #64
    Service.create(company: "Pantaya", country: "USA") #65
    Service.create(company: "Boomerang", country: "USA") #66
    Service.create(company: "UP Faith and Family", country: "USA") #67
    Service.create(company: "Urban Movie Channel", country: "USA") #68
    Service.create(company: "Dove Channel", country: "USA") #69
    Service.create(company: "Yupp TV", country: "USA") #70
    Service.create(company: "fuboTV", country: "USA") #71
    Service.create(company: "Criterion Channel", country: "USA") #72
    Service.create(company: "Magnolia Selects", country: "USA") #73
    Service.create(company: "WWE Network", country: "USA") #74
    Service.create(company: "Nickhits Amazon Channel", country: "USA") #75
    Service.create(company: "Noggin Amazon Channel", country: "USA") #76
    Service.create(company: "MyOutdoorTV", country: "USA") #77
    Service.create(company: "Tribeca Shortlist", country: "USA") #78
    Service.create(company: "Hopster TV", country: "USA") #79
    Service.create(company: "History Vault", country: "USA") #80
    Service.create(company: "Funimation Now", country: "USA") #81
    Service.create(company: "Laugh Out Loud", country: "USA") #82
    Service.create(company: "Smithsonian Channel", country: "USA") #83
    Service.create(company: "Pure Flix", country: "USA") #84
    Service.create(company: "Redbox", country: "USA") #85
    Service.create(company: "Hallmark Movies", country: "USA") #86
    Service.create(company: "Sports Illustrated", country: "USA") #87
    Service.create(company: "Crunchyroll", country: "USA") #88
    Service.create(company: "Lifetime Movie Club", country: "USA") #89
    Service.create(company: "Boomerang Amazon Channel", country: "USA") #90
    Service.create(company: "Cinemax Amazon Channel", country: "USA") #91
    Service.create(company: "Hallmark Movies Amazon Channel", country: "USA") #92
    Service.create(company: "MZ Choice Amazon Channel", country: "USA") #93
    Service.create(company: "Pantaya Amazon Channel", country: "USA") #94
    Service.create(company: "PBS Kids Amazon Channel", country: "USA") #95
    Service.create(company: "PBS Masterpiece Amazon Channel", country: "USA") #96
    Service.create(company: "Viewster Amazon Channel", country: "USA") #97
    Service.create(company: "Sling TV", country: "USA") #98
    Service.create(company: "PLuto TV", country: "USA") #99
    Service.create(company: "Cartoon Network", country: "USA") #100
    Service.create(company: "Adult Swim", country: "USA") #101
    Service.create(company: "USA Network", country: "USA") #102
    Service.create(company: "Fox", country: "USA") #103
    Service.create(company: "Snag Films", country: "USA") #104
    Service.create(company: "FlixFling", country: "USA") #105
    Service.create(company: "VUDU Free", country: "USA") #106
    Service.create(company: "Disney Plus", country: "USA") #107
    Service.create(company: "Bet+ Amazon Channel", country: "USA") #108
    Service.create(company: "Rakuten Viki", country: "USA") #109
    Service.create(company: "Apple TV Plus", country: "USA") #110
    Service.create(company: "AMC on Demand", country: "USA") #111
    Service.create(company: "Darkmatter TV", country: "USA") #112
    Service.create(company: "DIRECTV", country: "USA") #113
    Service.create(company: "TCM", country: "USA") #114
    Service.create(company: "TNT", country: "USA") #115
    Service.create(company: "Bravo TV", country: "USA") #116
    Service.create(company: "Food Network", country: "USA") #117
    Service.create(company: "IndieFlix", country: "USA") #118
    Service.create(company: "Quibi", country: "USA") #119
    # we need one of this per movie
    # AvailableService.create(service_id: 'reference the relevant service', movie_id: 'reference correct movie with OUR id, not tmdb', url: 'link to the movie')

  end
end
