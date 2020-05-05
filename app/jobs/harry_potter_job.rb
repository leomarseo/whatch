class HarryPotterJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # PAY ATTENTION: by now in the movie_id is stored the TMBD_ID

    # 1) Harry Potter and the Philosopher's Stone  --> no streaming service

    # 2) Harry Potter and the Chamber of Secrets
    AvailableService.create(service_id: 20, movie_id: 672, url: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6MTA5OTk0LCJvYmplY3RUeXBlIjoibW92aWUiLCJqd0VudGl0eUlkIjoidG0xMDk5OTQiLCJzZWFzb25OdW1iZXIiOjAsImVwaXNvZGVOdW1iZXIiOjB9fV19&r=http%3A%2F%2Fwww.nbc.com%2Fsyfy-movies%2Fvideo%2Fharry-potter-and-the-chamber-of-secrets%2F3758635&uct_country=us")
    AvailableService.create(service_id: 59, movie_id: 672, url: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJFcm9zIE5vdyIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJoZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6MTA5OTk0LCJvYmplY3RUeXBlIjoibW92aWUiLCJqd0VudGl0eUlkIjoidG0xMDk5OTQiLCJzZWFzb25OdW1iZXIiOjAsImVwaXNvZGVOdW1iZXIiOjB9fV19&r=https%3A%2F%2Ferosnow.com%2Fmovie%2Fwatch%2F1061224%2FSaadhu&uct_country=us")
    # 3) Harry Potter and the Prisoner of Azkaban
    AvailableService.create(service_id: 20, movie_id: 672, url: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6ODYyNzgsIm9iamVjdFR5cGUiOiJtb3ZpZSIsImp3RW50aXR5SWQiOiJ0bTg2Mjc4Iiwic2Vhc29uTnVtYmVyIjowLCJlcGlzb2RlTnVtYmVyIjowfX1dfQ&r=http%3A%2F%2Fwww.nbc.com%2Fmovies-on-usa%2Fvideo%2Fharry-potter-and-the-prisoner-of-azkaban%2F3774415&uct_country=us")
    # 4) Harry Potter and the Goblet of Fire
    AvailableService.create(service_id: 20, movie_id: 674, url: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6MTc4NjI4LCJvYmplY3RUeXBlIjoibW92aWUiLCJqd0VudGl0eUlkIjoidG0xNzg2MjgiLCJzZWFzb25OdW1iZXIiOjAsImVwaXNvZGVOdW1iZXIiOjB9fV19&r=http%3A%2F%2Fwww.nbc.com%2Fsyfy-movies%2Fvideo%2Fharry-potter-and-the-goblet-of-fire%2F3758863&uct_country=us")
    # 5) Harry Potter and the Order of the Phoenix
    AvailableService.create(service_id: 20, movie_id: 675, url: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6ODUzODIsIm9iamVjdFR5cGUiOiJtb3ZpZSIsImp3RW50aXR5SWQiOiJ0bTg1MzgyIiwic2Vhc29uTnVtYmVyIjowLCJlcGlzb2RlTnVtYmVyIjowfX1dfQ&r=http%3A%2F%2Fwww.nbc.com%2Fsyfy-movies%2Fvideo%2Fharry-potter-and-the-order-of-the-phoenix%2F3758872&uct_country=us")
    # 6) Harry Potter and the Half-Blood Prince
    AvailableService.create(service_id: 20, movie_id: 767, url: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6MTQ0Nzk4LCJvYmplY3RUeXBlIjoibW92aWUiLCJqd0VudGl0eUlkIjoidG0xNDQ3OTgiLCJzZWFzb25OdW1iZXIiOjAsImVwaXNvZGVOdW1iZXIiOjB9fV19&r=http%3A%2F%2Fwww.nbc.com%2Fsyfy-movies%2Fvideo%2Fharry-potter-and-the-half-blood-prince%2F3758873&uct_country=us")
    # 7) Harry Potter and the Deathly Hallows – Part 1
    AvailableService.create(service_id: 20, movie_id: 12444, url: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6OTE3ODcsIm9iamVjdFR5cGUiOiJtb3ZpZSIsImp3RW50aXR5SWQiOiJ0bTkxNzg3Iiwic2Vhc29uTnVtYmVyIjowLCJlcGlzb2RlTnVtYmVyIjowfX1dfQ&r=http%3A%2F%2Fwww.nbc.com%2Fsyfy-movies%2Fvideo%2Fharry-potter-and-the-deathly-hallows-part-1%2F3759156&uct_country=us")
    # 8) Harry Potter and the Deathly Hallows – Part 2
    AvailableService.create(service_id: 20, movie_id: 12445, url: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6MTc3Mjk3LCJvYmplY3RUeXBlIjoibW92aWUiLCJqd0VudGl0eUlkIjoidG0xNzcyOTciLCJzZWFzb25OdW1iZXIiOjAsImVwaXNvZGVOdW1iZXIiOjB9fV19&r=http%3A%2F%2Fwww.nbc.com%2Fsyfy-movies%2Fvideo%2Fharry-potter-and-the-deathly-hallows-part-2%2F3759160&uct_country=us")
  end
end

