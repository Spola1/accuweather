.env 

- ACCUWEATHER_TOKEN=bRMTOFQMfAEXxvzMrItkGFdUiKeeZG0A
- LOCATION_KEY=28801

- bundle install
- rails db:create && db:migrate
- rails s

- ✅ ruby 3.1.2, rails 7
- ✅ rufus for scheduled task
- ✅ swagger
- ✅ rspec, vcr
- ✅ redis for caching
- ✅ delayed job (active record)

#### Endpoints:
- http://0.0.0.0:3000/health
- http://0.0.0.0:3000/weather/historical/max
- http://0.0.0.0:3000/weather/historical/min
- http://0.0.0.0:3000/weather/historical/avg
- http://0.0.0.0:3000/weather/current
- http://0.0.0.0:3000/weather/historical
- http://0.0.0.0:3000/weather/by_time?timestamp=value