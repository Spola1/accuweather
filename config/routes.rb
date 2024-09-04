Rails.application.routes.draw do
  get "/weather/historical/min", to: "accuweather#historical_min"
  get "/weather/historical/max", to: "accuweather#historical_max"
  get "/weather/historical/avg", to: "accuweather#historical_avg"
  get "/weather/current", to: "accuweather#current"
  get "/weather/historical", to: "accuweather#historical"
  get "/weather/by_time", to: "accuweather#by_time"
  get "/health", to: "accuweather#health"
end
