class AddIconsToServicesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    used_services_ids = [4, 5, 8, 10, 12, 13, 14, 16, 18, 20, 27, 28, 42, 45, 47, 50, 57, 59, 62, 71, 80, 91, 99, 102, 106, 107, 113]

    Service.find(4).update(icon: "streaming_services/netflix_logo.jpg")
    Service.find(5).update(icon: "streaming_services/primevideo_logo.jpg")
    Service.find(8).update(icon: "streaming_services/crackle_logo.jpg")
    Service.find(10).update(icon: "streaming_services/hulu_logo.jpg")
    Service.find(12).update(icon: "streaming_services/hbonow_logo.jpg")
    Service.find(13).update(icon: "streaming_services/hbogo_logo.jpg")
    Service.find(14).update(icon: "streaming_services/showtime_logo.jpg")
    Service.find(16).update(icon: "streaming_services/starz_logo.jpg")
    Service.find(18).update(icon: "streaming_services/tubitv_logo.jpg")
    Service.find(20).update(icon: "streaming_services/nbc_logo.jpg")
    Service.find(27).update(icon: "streaming_services/fxnow_logo.jpg")
    Service.find(28).update(icon: "streaming_services/maxgo_logo.jpg")
    Service.find(42).update(icon: "streaming_services/starzplayamazonchannel_logo.jpg")
    Service.find(45).update(icon: "streaming_services/cbsallaccessamazonchannel_logo.jpg")
    Service.find(47).update(icon: "streaming_services/hbonowamazonchannel_logo.jpg")
    Service.find(50).update(icon: "streaming_services/showtimeamazonchannel_logo.jpg")
    Service.find(57).update(icon: "streaming_services/hoopla_logo.jpg")
    Service.find(59).update(icon: "streaming_services/erosnow_logo.jpg")
    Service.find(62).update(icon: "streaming_services/imdbtv_logo.jpg")
    Service.find(71).update(icon: "streaming_services/fubotv_logo.jpg")
    Service.find(80).update(icon: "streaming_services/historyvault_logo.jpg")
    Service.find(91).update(icon: "streaming_services/cinemax_logo.jpg")
    Service.find(98).update(icon: "streaming_services/sling_logo.jpg")
    Service.find(99).update(icon: "streaming_services/plutotv_logo.jpg")
    Service.find(102).update(icon: "streaming_services/usanetwork_logo.jpg")
    Service.find(106).update(icon: "streaming_services/vudu_logo.jpg")
    Service.find(107).update(icon: "streaming_services/disney_logo.jpg")
    Service.find(113).update(icon: "streaming_services/directv_logo.jpg")

  end
end
