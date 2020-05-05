class AddIconsToServicesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    used_services_ids = [4, 5, 8, 10, 12, 13, 14, 16, 18, 20, 27, 28, 42, 45, 47, 50, 57, 59, 62, 71, 80, 91, 99, 102, 106, 107, 113]

    Service.find(4).update(icon: "streaming_services/netflix_logo.png")
    Service.find(5).update(icon: "streaming_services/primevideo_logo.png")
    Service.find(8).update(icon: "streaming_services/crackle_logo.png")
    Service.find(10).update(icon: "streaming_services/hulu_logo.png")
    Service.find(12).update(icon: "streaming_services/hbonow_logo.png")
    Service.find(13).update(icon: "streaming_services/hbogo_logo.png")
    Service.find(14).update(icon: "streaming_services/showtime_logo.png")
    Service.find(16).update(icon: "streaming_services/starz_logo.png")
    Service.find(18).update(icon: "streaming_services/tubitv_logo.png")
    Service.find(20).update(icon: "streaming_services/nbc_logo.png")
    Service.find(27).update(icon: "streaming_services/fxnow_logo.png")
    Service.find(28).update(icon: "streaming_services/maxgo_logo.png")
    Service.find(42).update(icon: "streaming_services/starzplayamazonchannel_logo.png")
    Service.find(45).update(icon: "streaming_services/cbsallaccessamazonchannel_logo.png")
    Service.find(47).update(icon: "streaming_services/hbonow_logo.png")
    Service.find(50).update(icon: "streaming_services/showtime_logo.png")
    Service.find(57).update(icon: "streaming_services/hoopla_logo.png")
    Service.find(59).update(icon: "streaming_services/erosnow_logo.png")
    Service.find(62).update(icon: "streaming_services/imdbtv_logo.png")
    Service.find(71).update(icon: "streaming_services/fubotv_logo.png")
    Service.find(80).update(icon: "streaming_services/historyvault_logo.png")
    Service.find(91).update(icon: "streaming_services/cinemax_logo.png")
    Service.find(99).update(icon: "streaming_services/plutotv_logo.png")
    Service.find(102).update(icon: "streaming_services/usanetwork_logo.png")
    Service.find(106).update(icon: "streaming_services/vudu_logo.png")
    Service.find(107).update(icon: "streaming_services/disney_logo.png")
    Service.find(113).update(icon: "streaming_services/directv_logo.png")

  end
end
