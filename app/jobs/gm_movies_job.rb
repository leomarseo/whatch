# class GmMoviesJob < ApplicationJob
#   queue_as :default

#   def perform(*args)

#     # repeat this for all services we need
#     Service.create(company: 'some', country: 'some')

#     # we need one of this per movie
#     AvailableService.create(service_id: 'reference the relevant service', movie_id: 'reference correct movie with OUR id, not tmdb', url: 'link to the movie')
#   end
# end


# # HARRY POTTER
# 1) https://www.themoviedb.org/movie/671-harry-potter-and-the-philosopher-s-stone?language=en-US

# 2) https://www.themoviedb.org/movie/672-harry-potter-and-the-chamber-of-secrets/watch?language=en-US&locale=US

#     - Erosnow: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJFcm9zIE5vdyIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJoZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6MTA5OTk0LCJvYmplY3RUeXBlIjoibW92aWUiLCJqd0VudGl0eUlkIjoidG0xMDk5OTQiLCJzZWFzb25OdW1iZXIiOjAsImVwaXNvZGVOdW1iZXIiOjB9fV19&r=https%3A%2F%2Ferosnow.com%2Fmovie%2Fwatch%2F1061224%2FSaadhu&uct_country=us"
#     - nbc: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6MTA5OTk0LCJvYmplY3RUeXBlIjoibW92aWUiLCJqd0VudGl0eUlkIjoidG0xMDk5OTQiLCJzZWFzb25OdW1iZXIiOjAsImVwaXNvZGVOdW1iZXIiOjB9fV19&r=http%3A%2F%2Fwww.nbc.com%2Fsyfy-movies%2Fvideo%2Fharry-potter-and-the-chamber-of-secrets%2F3758635&uct_country=us"
# 3) https://www.themoviedb.org/movie/673-harry-potter-and-the-prisoner-of-azkaban/watch?language=en-US&locale=US

#     - nbc: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6ODYyNzgsIm9iamVjdFR5cGUiOiJtb3ZpZSIsImp3RW50aXR5SWQiOiJ0bTg2Mjc4Iiwic2Vhc29uTnVtYmVyIjowLCJlcGlzb2RlTnVtYmVyIjowfX1dfQ&r=http%3A%2F%2Fwww.nbc.com%2Fmovies-on-usa%2Fvideo%2Fharry-potter-and-the-prisoner-of-azkaban%2F3774415&uct_country=us"

# 4) https://www.themoviedb.org/movie/674-harry-potter-and-the-goblet-of-fire?language=en-US

#     - nbc: "https://click.justwatch.com/a?cx=eyJzY2hlbWEiOiJpZ2x1OmNvbS5zbm93cGxvd2FuYWx5dGljcy5zbm93cGxvdy9jb250ZXh0cy9qc29uc2NoZW1hLzEtMC0wIiwiZGF0YSI6W3sic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL2NsaWNrb3V0X2NvbnRleHQvanNvbnNjaGVtYS8xLTEtMCIsImRhdGEiOnsicHJvdmlkZXIiOiJVU0EgTmV0d29yayIsIm1vbmV0aXphdGlvblR5cGUiOiJmbGF0cmF0ZSIsInByZXNlbnRhdGlvblR5cGUiOiJzZCIsImN1cnJlbmN5IjoiVVNEIiwicHJpY2UiOjAsIm9yaWdpbmFsUHJpY2UiOjAsImF1ZGlvTGFuZ3VhZ2UiOiIiLCJzdWJ0aXRsZUxhbmd1YWdlIjoiIiwiY2luZW1hSWQiOjAsInNob3d0aW1lIjoiIiwiaXNGYXZvcml0ZUNpbmVtYSI6ZmFsc2UsInBhcnRuZXJJZCI6Nn19LHsic2NoZW1hIjoiaWdsdTpjb20uanVzdHdhdGNoL3RpdGxlX2NvbnRleHQvanNvbnNjaGVtYS8xLTAtMCIsImRhdGEiOnsidGl0bGVJZCI6MTc4NjI4LCJvYmplY3RUeXBlIjoibW92aWUiLCJqd0VudGl0eUlkIjoidG0xNzg2MjgiLCJzZWFzb25OdW1iZXIiOjAsImVwaXNvZGVOdW1iZXIiOjB9fV19&r=http%3A%2F%2Fwww.nbc.com%2Fsyfy-movies%2Fvideo%2Fharry-potter-and-the-goblet-of-fire%2F3758863&uct_country=us"
